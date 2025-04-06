### #2 Phase Plane Analysis

- **Phase plane analysis**는 2차 시스템을 분석하기 위한 **그래픽 기법**이다.
- **Definition**: Phase plane analysis is a graphical method for studying second-order systems.
- **특징**:
    - 시각적 방법으로 1차, 2차, 3차 시스템까지 분석 가능
    - 복잡한 시스템의 동작점을 수치해석적 방법과 그래프를 통해 파악할 수 있음

### #3 Second-Order Autonomous Systems

2차 자율 시스템은 다음과 같이 표현된다:

$\dot{x}_1 = f_1(x_1, x_2), \quad \dot{x}_2 = f_2(x_1, x_2)$

- $x_1$, $x_2$: 시스템의 상태 변수
- $f_1$, $f_2$: 상태 변수의 비선형 함수

### #4 Phase Plane

- 이 시스템의 **상태 공간(state space)**은 $x_1$과 $x_2$를 좌표로 갖는 **2차원 평면**이며, 이를 **phase plane**이라고 한다.
- 시간에 따라 변화하는 자율 시스템의 해는 **phase plane 상의 곡선**으로 나타나며, 이를 **phase trajectory**라고 한다.
- 다양한 초기 조건에 따른 여러 해의 곡선 집합을 **phase portrait**라고 한다.

### #11 Singular Points

- **Singular point**란 **phase plane**에서의 **평형점(equilibrium point)**을 의미한다.
- **평형점 정의**: 시스템의 상태가 **영원히 머무를 수 있는 점**, 즉 다음 조건을 만족하는 점이다:

$\dot{x} = 0$

- 수학적으로는 다음과 같이 표현된다:

$\dot{x}_1 = f_1(x_1, x_2) \Rightarrow f_1(x_1, x_2) = 0$

$\dot{x}_2 = f_2(x_1, x_2) \Rightarrow f_2(x_1, x_2) = 0$

- 즉, 두 함수 $f_1$, $f_2$가 동시에 0이 되는 ($x_1$, $x_2$)가 **singular point**이다

### #13 Example: Nonlinear Second-Order System

**시스템 방정식**

$\ddot{x} + 0.6\dot{x} + 3x + x^2 = 0$

- 비선형 2차 자율 시스템

**상태 공간 표현**

상태 변수를 $x_1 = x$, $x_2 = \dot{x}$로 정의하면:

$\begin{cases}
\dot{x}_1 = x_2 \\
\dot{x}_2 = -0.6x_2 - 3x_1 - x_1^2
\end{cases}$

**평형점 (Singular Points)**

- 평형점 조건: $\dot{x}_1 = 0, \dot{x}_2 = 0$
- 식을 풀면:

$\begin{cases}
x_2 = 0 \\
-3x_1 - x_1^2 = 0 \Rightarrow x_1(3 + x_1) = 0
\end{cases}$

- 따라서 두 개의 평형점이 존재:
    - $(x_1, x_2) = (0, 0)$
    - $(x_1, x_2) = (-3, 0)$

**각 평형점의 특성**

- **원점 $(0, 0)$**: $\begin{cases}
\text{특성: Stable focus or node} \\
\text{수렴성: } \lim_{t \to \infty} (x_1(t), x_2(t)) = (0, 0)
\end{cases}$
- **점 $(-3, 0)$**: $\begin{cases}
\text{특성: Saddle point} \\
\text{조건: } \exists t_1, t_2: (x_1(t_1), x_2(t_1)) = (x_1(t_2), x_2(t_2)) = (-3, 0)
\end{cases}$

```bash
import numpy as np
import matplotlib.pyplot as plt

# Define the system
def dx_dt(x, y):
    return y

def dy_dt(x, y):
    return -0.6*y - 3*x - x**2

# Create a grid
x_vals = np.linspace(-5, 2, 20)
y_vals = np.linspace(-4, 4, 20)
X, Y = np.meshgrid(x_vals, y_vals)

# Compute derivatives on the grid
U = dx_dt(X, Y)
V = dy_dt(X, Y)

# Normalize arrows for better visualization
magnitude = np.sqrt(U**2 + V**2)
U /= magnitude
V /= magnitude

# Plotting
plt.figure(figsize=(8, 6))
plt.quiver(X, Y, U, V, color='blue', angles='xy')
plt.xlabel('$x_1$')
plt.ylabel('$x_2$')
plt.title('Phase Portrait: $\ddot{x} + 0.6\dot{x} + 3x + x^2 = 0$')
plt.grid(True)
plt.axhline(0, color='black', linewidth=0.5)
plt.axvline(0, color='black', linewidth=0.5)
plt.scatter([0, -3], [0, 0], color='red', label='Singular Points')
plt.legend()
plt.tight_layout()
plt.show()

```

### #14 Why is an Equilibrium Point Called a Singular Point?

- **2차 시스템의 평형점**은 **phase plane 상에서 특별한 성질**을 가지기 때문에 **singular point (특이점)**이라고 불린다.

**Phase Trajectory의 기울기**

주어진 점 $(x_1, x_2)$를 지나는 **phase trajectory의 기울기**는 다음과 같이 정의된다:

$\frac{dx_2}{dx_1} = \frac{f_2(x_1, x_2)}{f_1(x_1, x_2)}$

- 여기서 $f_1(x_1, x_2)$와 $f_2(x_1, x_2)$는 상태 변수의 변화율을 나타내는 단일값(single-valued) 함수라고 가정한다.

**Singular Point의 의미**

- 평형점에서는 $f_1(x_1, x_2) = 0$ 그리고 $f_2(x_1, x_2) = 0$이므로, 위의 **기울기 식이 정의되지 않음** (분모와 분자가 모두 0).
- 이로 인해 해당 점에서는 **phase trajectory의 방향이 정의되지 않으며**, 일반적인 곡선과는 다른 **특이한 성질**을 보인다.
- 따라서 이러한 점을 **singular point**라고 부른다.

**추가적으로**

- $f_1$, $f_2$가 단일값 함수이므로, **하나의 점에서 두 개 이상의 trajectory가 교차하지 않음** (해의 유일성 보장).
- 단, **singular point에서는 이러한 일반 원리가 깨질 수 있음** → 이 점이 "특이한" 이유!

### #18 Phase Portrait of a First-Order System

**시스템 정의**

$\dot{x} + f(x) = 0 \quad \Rightarrow \quad \dot{x} = -f(x)$

- 1차 시스템의 경우, **phase portrait**는 **하나의 궤적**(line trajectory)으로 구성된다.
- 이는 상태 공간이 1차원( $x$축)으로 이루어져 있기 때문.

**예시: $\dot{x} = -4x + x^3$**

- 이 시스템은 다음과 같이 정의된다: $\dot{x} = -4x + x^3$
- **평형점(singular points)**은 $\dot{x} = 0$이 되는 지점:
    
    $-4x + x^3 = 0 \Rightarrow x(-4 + x^2) = 0 \Rightarrow x = 0,\ \pm2$
    
- 따라서 세 개의 평형점 존재: $x = -2$, $x = 0$, $x = 2$

**Phase Portrait 특징**

- **phase portrait**는 실선상의 단일 궤적(trajectory)로 표현되며, 시간에 따른 **화살표 방향**은 $\dot{x}$의 부호에 따라 결정됨:
    - $\dot{x} > 0$ → 오른쪽 방향
    - $\dot{x} < 0$ → 왼쪽 방향
- 각 구간에서의 방향:
    - $x < -2$: $\dot{x} < 0$ → 왼쪽
    - $-2 < x < 0$: $\dot{x} > 0$ → 오른쪽
    - $0 < x < 2$: $\dot{x} < 0$ → 왼쪽
    - $x > 2$: $\dot{x} > 0$ → 오른쪽