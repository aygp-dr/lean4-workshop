/-
  Solutions for Exercise 01: Basic Tactics in Lean 4
  ==================================================

  These are the complete solutions for Ex01_Basics.lean.
  Study these after attempting the exercises yourself!
-/

namespace Sol01_Basics

/-
  SECTION 1: Reflexivity
-/

-- Solution 1.1
theorem forty_two_eq_self : 42 = 42 := by
  rfl

-- Solution 1.2
theorem hello_eq_hello : "hello" = "hello" := by
  rfl

-- Solution 1.3
theorem nat_eq_self (n : Nat) : n = n := by
  rfl

/-
  SECTION 2: Function Application
-/

def double (n : Nat) : Nat := n + n

-- Solution 2.1
theorem double_five : double 5 = 10 := by
  rfl

-- Solution 2.2
theorem double_zero : double 0 = 0 := by
  rfl

/-
  SECTION 3: Simplification
-/

-- Solution 3.1
theorem add_zero_right (n : Nat) : n + 0 = n := by
  simp

-- Solution 3.2
theorem mul_one_right (n : Nat) : n * 1 = n := by
  simp

-- Solution 3.3
theorem and_true (b : Bool) : Bool.and b Bool.true = b := by
  cases b
  · rfl
  · rfl

/-
  SECTION 4: Exact
-/

-- Solution 4.1
theorem use_hypothesis (P : Prop) (h : P) : P := by
  exact h

-- Solution 4.2
theorem use_first (P Q : Prop) (hp : P) (hq : Q) : P := by
  exact hp

-- Solution 4.3
theorem use_second (P Q : Prop) (hp : P) (hq : Q) : Q := by
  exact hq

/-
  SECTION 5: Combining Tactics
-/

def square (n : Nat) : Nat := n * n

-- Solution 5.1
theorem square_three : square 3 = 9 := by
  rfl

-- Solution 5.2
theorem double_double_two : double (double 2) = 8 := by
  rfl

-- Solution 5.3
theorem zero_add_n (n : Nat) : 0 + n = n := by
  simp

end Sol01_Basics
