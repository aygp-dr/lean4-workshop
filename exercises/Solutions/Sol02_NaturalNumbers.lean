/-
  Solutions for Exercise 02: Natural Number Proofs
  ================================================

  These are the complete solutions for Ex02_NaturalNumbers.lean.
  Study these after attempting the exercises yourself!
-/

namespace Sol02_NaturalNumbers

/-
  SECTION 1: Basic Properties of Addition
-/

-- Solution 1.1
theorem add_zero (n : Nat) : n + 0 = n := by
  rfl

-- Solution 1.2
theorem zero_add (n : Nat) : 0 + n = n := by
  simp

-- Solution 1.3
theorem add_one (n : Nat) : n + 1 = Nat.succ n := by
  rfl

/-
  SECTION 2: Commutativity and Associativity
-/

-- Solution 2.1
theorem add_comm (m n : Nat) : m + n = n + m := by
  exact Nat.add_comm m n

-- Solution 2.2
theorem add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  exact Nat.add_assoc a b c

-- Solution 2.3
theorem add_rearrange (a b c : Nat) : a + b + c = c + b + a := by
  omega

/-
  SECTION 3: Simple Induction
-/

def sumTo : Nat -> Nat
  | 0 => 0
  | n + 1 => (n + 1) + sumTo n

-- Solution 3.1
theorem sumTo_zero : sumTo 0 = 0 := by
  rfl

-- Solution 3.2
theorem sumTo_one : sumTo 1 = 1 := by
  rfl

-- Solution 3.3
theorem sumTo_three : sumTo 3 = 6 := by
  rfl

/-
  SECTION 4: Multiplication Properties
-/

-- Solution 4.1
theorem mul_zero (n : Nat) : n * 0 = 0 := by
  rfl

-- Solution 4.2
theorem mul_one (n : Nat) : n * 1 = n := by
  simp

-- Solution 4.3
theorem zero_mul (n : Nat) : 0 * n = 0 := by
  simp

-- Solution 4.4
theorem mul_add_distrib (a b c : Nat) : a * (b + c) = a * b + a * c := by
  exact Nat.mul_add a b c

/-
  SECTION 5: Inequalities
-/

-- Solution 5.1
theorem le_refl (n : Nat) : n <= n := by
  exact Nat.le_refl n

-- Solution 5.2
theorem zero_le (n : Nat) : 0 <= n := by
  exact Nat.zero_le n

-- Solution 5.3
theorem le_add_right (a b c : Nat) (h : a <= b) : a <= b + c := by
  omega

/-
  SECTION 6: Challenge Problems
-/

def double (n : Nat) : Nat := n + n

-- Challenge 6.1
theorem double_eq_two_mul (n : Nat) : double n = 2 * n := by
  simp [double, Nat.two_mul]

-- Challenge 6.2
theorem lt_succ_self (n : Nat) : n < n + 1 := by
  exact Nat.lt_succ_self n

-- Challenge 6.3
-- Note: This proof uses induction and factoring
theorem sumTo_formula (n : Nat) : 2 * sumTo n = n * (n + 1) := by
  induction n with
  | zero => rfl
  | succ k ih =>
    unfold sumTo
    rw [Nat.mul_add, ih]
    -- Goal: 2 * (k + 1) + k * (k + 1) = (k + 1) * (k + 1 + 1)
    -- Factor (k + 1) from left side
    have factored : 2 * (k + 1) + k * (k + 1) = (2 + k) * (k + 1) := by
      rw [Nat.add_mul]
    rw [factored]
    rw [Nat.mul_comm]
    congr 1
    omega

end Sol02_NaturalNumbers
