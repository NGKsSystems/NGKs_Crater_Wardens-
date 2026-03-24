extends Node

# ============================================================
# AudioManager.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 7: VFX / Audio Polish
# ============================================================
# Responsibilities:
#   - Synthesise all SFX at startup using AudioStreamWAV (no external files)
#   - Expose fire/hit/explode/jump/checkpoint/stage_complete play methods
#   - One AudioStreamPlayer per sound (stops & restarts on repeat)
#
# Synthesis runs in _ready() (load time only — zero gameplay cost)
# All sounds <= 0.5 seconds — arcade-appropriate blips
# Volume: -6 dB global, quieter for fire (-10 dB) to avoid spam
# ============================================================

const _RATE : int = 22050   # sample rate (Hz)

var _players : Dictionary = {}   # name → AudioStreamPlayer


func _ready() -> void:
	_mk("fire",           _beep(820.0,  0.07, 0.40, "square"), -10.0)
	_mk("hit",            _beep(310.0,  0.12, 0.55, "noise"),   -6.0)
	_mk("explode",        _beep(110.0,  0.30, 0.65, "noise"),   -6.0)
	_mk("jump",           _sweep(190.0, 520.0, 0.14, 0.45),     -6.0)
	_mk("checkpoint",     _beep(1050.0, 0.20, 0.45, "sine"),    -6.0)
	_mk("stage_complete", _chord([523.0, 659.0, 784.0], 0.42, 0.40), -4.0)


func play_fire()           -> void: _play("fire")
func play_hit()            -> void: _play("hit")
func play_explode()        -> void: _play("explode")
func play_jump()           -> void: _play("jump")
func play_checkpoint()     -> void: _play("checkpoint")
func play_stage_complete() -> void: _play("stage_complete")


# ── internal helpers ─────────────────────────────────────────

func _play(name: String) -> void:
	var p = _players.get(name)
	if p == null:
		return
	p.stop()
	p.play()


func _mk(name: String, stream: AudioStreamWAV, vol_db: float) -> void:
	var p := AudioStreamPlayer.new()
	p.stream    = stream
	p.volume_db = vol_db
	add_child(p)
	_players[name] = p


# Single-tone waveform with exponential decay envelope.
# shape: "sine" | "square" | "noise"
func _beep(freq: float, dur: float, vol: float, shape: String) -> AudioStreamWAV:
	var n    := int(_RATE * dur)
	var data := PackedByteArray()
	data.resize(n * 2)
	for i in n:
		var t   : float = float(i) / _RATE
		var env : float = 1.0 - pow(float(i) / n, 0.35)
		var s   : float
		match shape:
			"sine":
				s = sin(TAU * freq * t)
			"square":
				s = 1.0 if fmod(freq * t, 1.0) < 0.5 else -1.0
			"noise":
				s = randf() * 2.0 - 1.0
			_:
				s = sin(TAU * freq * t)
		var v : int = int(clamp(s * env * vol, -1.0, 1.0) * 32767)
		data[i * 2]     = v & 0xFF
		data[i * 2 + 1] = (v >> 8) & 0xFF
	return _wav(data)


# Frequency sweep with phase accumulation (no aliasing).
func _sweep(f0: float, f1: float, dur: float, vol: float) -> AudioStreamWAV:
	var n     := int(_RATE * dur)
	var data  := PackedByteArray()
	data.resize(n * 2)
	var phase : float = 0.0
	for i in n:
		var ratio : float = float(i) / n
		var freq  : float = f0 + (f1 - f0) * ratio
		var env   : float = 1.0 - pow(ratio, 0.5)
		phase += TAU * freq / _RATE
		var v : int = int(clamp(sin(phase) * env * vol, -1.0, 1.0) * 32767)
		data[i * 2]     = v & 0xFF
		data[i * 2 + 1] = (v >> 8) & 0xFF
	return _wav(data)


# Sum of sine waves at multiple frequencies (chord).
func _chord(freqs: Array, dur: float, vol: float) -> AudioStreamWAV:
	var n     := int(_RATE * dur)
	var data  := PackedByteArray()
	data.resize(n * 2)
	var fc    : float = float(freqs.size())
	for i in n:
		var t   : float = float(i) / _RATE
		var env : float = 1.0 - pow(float(i) / n, 0.28)
		var s   : float = 0.0
		for freq in freqs:
			s += sin(TAU * float(freq) * t)
		var v : int = int(clamp(s / fc * env * vol, -1.0, 1.0) * 32767)
		data[i * 2]     = v & 0xFF
		data[i * 2 + 1] = (v >> 8) & 0xFF
	return _wav(data)


# Assemble AudioStreamWAV from raw 16-bit mono PCM data.
func _wav(data: PackedByteArray) -> AudioStreamWAV:
	var w := AudioStreamWAV.new()
	w.format   = AudioStreamWAV.FORMAT_16_BITS
	w.stereo   = false
	w.mix_rate = _RATE
	w.data     = data
	return w
