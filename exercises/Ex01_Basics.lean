/-
  Exercise 01: Basic Tactics in Lean 4
  =====================================

  This file introduces fundamental proof tactics:
  - `rfl` (reflexivity): Proves that something equals itself
  - `simp` (simplification): Applies rewrite rules automatically
  - `exact`: Provides the exact proof term needed

  Replace each `sorry` with the appropriate tactic or term.
  Difficulty: Beginner
-/

namespace Ex01_Basics

/-
  SECTION 1: Reflexivity
  ----------------------
  The `rfl` tactic proves goals of the form `a = a`.
  It works because equality is reflexive by definition.
-/

-- Exercise 1.1: Prove that 42 equals itself
theorem forty_two_eq_self : 42 = 42 := by
  sorry

-- Exercise 1.2: Prove that a string equals itself
theorem hello_eq_hello : "hello" = "hello" := by
  sorry

-- Exercise 1.3: Prove that any natural number equals itself
-- Hint: This works for any `n`, not just specific values
theorem nat_eq_self (n : Nat) : n = n := by
  sorry

/-
  SECTION 2: Function Application
  -------------------------------
  When we have a function and apply it to arguments,
  `rfl` can prove the result equals the computed value.
-/

-- A simple function for exercises
def double (n : Nat) : Nat := n + n

-- Exercise 2.1: Prove that double 5 = 10
theorem double_five : double 5 = 10 := by
  sorry

-- Exercise 2.2: Prove that double 0 = 0
theorem double_zero : double 0 = 0 := by
  sorry

/-
  SECTION 3: Simplification
  -------------------------
  The `simp` tactic automatically applies simplification lemmas.
  It's more powerful than `rfl` but can be slower.
-/

-- Exercise 3.1: Prove that adding 0 on the right gives the same number
-- Hint: `simp` knows basic arithmetic facts
theorem add_zero_right (n : Nat) : n + 0 = n := by
  sorry

-- Exercise 3.2: Prove that multiplying by 1 gives the same number
theorem mul_one_right (n : Nat) : n * 1 = n := by
  sorry

-- Exercise 3.3: Prove this simplification of boolean and
-- Note: We use Bool.and and Bool.true explicitly
theorem and_true (b : Bool) : Bool.and b Bool.true = b := by
  sorry

/-
  SECTION 4: Exact
  ----------------
  The `exact` tactic provides an explicit proof term.
  Use it when you have a hypothesis or theorem that matches exactly.
-/

-- Exercise 4.1: Given a proof of P, prove P
-- Hint: `exact h` uses hypothesis h directly
theorem use_hypothesis (P : Prop) (h : P) : P := by
  sorry

-- Exercise 4.2: Given proofs of P and Q, prove P
-- Hint: Which hypothesis do you need?
theorem use_first (P Q : Prop) (hp : P) (hq : Q) : P := by
  sorry

-- Exercise 4.3: Given proofs of P and Q, prove Q
theorem use_second (P Q : Prop) (hp : P) (hq : Q) : Q := by
  sorry

/-
  SECTION 5: Combining Tactics
  ----------------------------
  Real proofs often combine multiple tactics.
-/

-- Helper function
def square (n : Nat) : Nat := n * n

-- Exercise 5.1: Prove that square of 3 is 9
theorem square_three : square 3 = 9 := by
  sorry

-- Exercise 5.2: Prove that double of double of 2 is 8
theorem double_double_two : double (double 2) = 8 := by
  sorry

-- Exercise 5.3: Prove this identity using simp
theorem zero_add_n (n : Nat) : 0 + n = n := by
  sorry

end Ex01_Basics
