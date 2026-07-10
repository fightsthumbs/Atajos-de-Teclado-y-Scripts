#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FormatTime, var, %A_Now%, dd 'de' MMMM


;escribe el dia y el mes
::fechahoy::
FormatTime, todaysDate, %A_Now%, dd 'de' MMMM
sendInput, %todaysDate%
return

:*:|isodate::
:*:|today::
FormatTime, todaysDate, %A_Now%, yyyyMMdd
sendInput, %todaysDate%
return


:*:--{Left}::→
:*:<--::←
:*:<-->::↔
:*:c//::₡ ;"ALT + 198"
:*:e//::€
:*:|copyr::©


:*:|cr::🇨🇷
:*:|im::🇮🇲
:?*:|par::§

; ============================================
; HOTSTRINGS PARA SÍMBOLOS MATEMÁTICOS
; ============================================

; LETRAS GRIEGAS MINÚSCULAS
:*:|alpha::α
:*:|beta::β
:*:|gamma::γ
:*:|delta::δ
:*:|epsilon::ε
:*:|zeta::ζ
:*:|eta::η
:*:|theta::θ
:*:|iota::ι
:*:|kappa::κ
:*:|lambda::λ
:*:|mu::μ
:*:|nu::ν
:*:|xi::ξ
:*:|omicron::ο
:*:|pi::π
:*:|rho::ρ
:*:|sigma::σ
:*:|tau::τ
:*:|upsilon::υ
:*:|phi::φ
:*:|chi::χ
:*:|psi::ψ
:*:|omega::ω

; LETRAS GRIEGAS MAYÚSCULAS
:*:|Alpha::Α
:*:|Beta::Β
:*:|Gamma::Γ
:*:|Delta::Δ
:*:|Epsilon::Ε
:*:|Theta::Θ
:*:|Lambda::Λ
:*:|Xi::Ξ
:*:|Pi::Π
:*:|Sigma::Σ
:*:|Phi::Φ
:*:|Psi::Ψ
:*:|Omega::Ω

; OPERADORES MATEMÁTICOS
:*:|pm::±
:*:|mp::∓
:*:|times::×
:*:|div::÷
:*:|cdot::·
:*:|ast::∗
:*:|star::⋆
:*:|circ::∘
:*:|bullet::•

; RELACIONES Y COMPARACIONES
:*:|le::≤
:*:|ge::≥
:*:|ne::≠
:*:|approx::≈
:*:|equiv::≡
:*:|sim::∼
:*:|cong::≅
:*:|prop::∝
:*:|ll::≪
:*:|gg::≫

; CONJUNTOS
::|in::∈
:*:|notin::∉
:*:|ni::∋
:*:|subset::⊂
:*:|supset::⊃
:*:|subseteq::⊆
:*:|supseteq::⊇
:*:|cup::∪
:*:|cap::∩
:*:|emptyset::∅
:*:|setminus::∖

; LÓGICA
:*:|and::∧
:*:|or::∨
:*:|neg::¬
:*:|forall::∀
:*:|exists::∃
:*:|nexists::∄
:*:|therefore::∴
:*:|because::∵

; CÁLCULO E INFINITO
:*:|infty::∞
:*:|partial::∂
:*:|nabla::∇
:*:|int::∫
:*:|iint::∬
:*:|iiint::∭
:*:|oint::∮
:*:|sum::∑
:*:|prod::∏
:*:|coprod::∐

; FLECHAS
:*:|to::→
:*:|rightarrow::→
:*:|leftarrow::←
:*:|leftrightarrow::↔
:*:|Rightarrow::⇒
:*:|Leftarrow::⇐
:*:|Leftrightarrow::⇔
:*:|mapsto::↦
:*:|uparrow::↑
:*:|downarrow::↓

; RAÍCES Y POTENCIAS
:*:|sqrt::√
:*:|cbrt::∛
:*:|sup2::²
:*:|sup3::³
:*:|sup1::¹

; FRACCIONES COMUNES
:*:|frac12::½
:*:|frac13::⅓
:*:|frac23::⅔
:*:|frac14::¼
:*:|frac34::¾
:*:|frac15::⅕
:*:|frac18::⅛

; SÍMBOLOS ESPECIALES
:*:|deg::°
:*:|angle::∠
:*:|perp::⊥
:*:|parallel::∥
:*:|triangle::△

; NÚMEROS Y CONSTANTES
:*:|Re::ℝ
:*:|Co::ℂ
:*:|Na::ℕ
:*:|Zo::ℤ
:*:|Qo::ℚ
:*:|aleph::ℵ

; MISCELÁNEOS
:*:|hbar::ℏ
:*:|ell::ℓ
:*:|wp::℘
:*:|oplus::⊕
:*:|ominus::⊖
:*:|otimes::⊗
:*:|odot::⊙
:*:|dagger::†
:*:|ddagger::‡



;§
;≈
;¤∵∴∵∓∞※±⁂‡


;escribir versión
;:O?:v1::(v1)
:?*:|v1::_v1_
:?*:|v2::_v2_
:?*:|v3::_v3_
:?*:|v4::_v4_
:?*:|v5::_v5_
:?*:|v6::_v6_
:?*:|v7::_v7_
:?*:|v8::_v8_
:?*:|v9::_v9_