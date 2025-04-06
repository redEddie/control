## #8 선형 시스템과 비선형 시스템의 해석적 해
- Linear systems have closed form solutions. Nonlinear systems do not have closed form solutions.
- 선형 시스템은 해석적 해(closed form solution)를 가지지만, 비선형 시스템은 해석적 해를 가지지 않는다.

## #10 선형 시스템과 비선형 시스템의 상태 공간 표현
### 선형 시스템
- $\dot{x} = Ax + Bu$
- $y = Cx$
- 여기서:
  - $x$: 상태 벡터 ($\mathbb{R}^n$)
  - $u$: 입력 벡터 ($\mathbb{R}^m$)
  - $y$: 출력 벡터 ($\mathbb{R}^p$)
  - $A, B, C$: 상수 행렬

### 비선형 시스템
- $\dot{x} = f(x, u)$
- $y = \phi(x)$
- 여기서:
  - $f: \mathbb{R}^n \times \mathbb{R}^m \rightarrow \mathbb{R}^n$
  - $\phi: \mathbb{R}^n \rightarrow \mathbb{R}^p$
  - $f$와 $\phi$는 비선형 함수

## #11 안정성과 주파수 응답
### 안정성
- Linear: Stability depends on the systems parameters.
- Nonlinear: Stability depends on the initial conditions, input signals, as well as the system parameters.
- 선형: 안정성은 시스템 파라미터에 의존한다.
- 비선형: 안정성은 초기 조건, 입력 신호, 그리고 시스템 파라미터에 모두 의존한다.

### 주파수 응답
- Output of a linear systems has the same frequency as the input although its amplitude and phase may differ.
- Output of a nonlinear system usually contains additional frequency components and may, in fact, not contain the input of frequency.
- 선형 시스템의 출력은 진폭과 위상은 다를 수 있지만 입력과 동일한 주파수를 가진다.
- 비선형 시스템의 출력은 일반적으로 추가적인 주파수 성분을 포함하며, 실제로 입력 주파수를 포함하지 않을 수도 있다.

## #12 선형 시스템 판별 규칙
### 기억하기 쉬운 규칙
- All functions in RHS of diff.e.q. of the state equation are linear.
- The system is linear under at least zero input or zero initial condition.
- 상태 방정식의 미분 방정식 우변의 모든 함수가 선형이면 선형 시스템이다.
- 시스템은 최소한 영입력 또는 영초기조건에서 선형이어야 한다.

## #15 자율 시스템과 비자율 시스템
### 정의
- Time invariant systems are called autonomous and time varying ones are called non-autonomous.
- Autonomous ~ systems with no external input.
- **Autonomous systems are time invariant systems with no external input.**
- 시간 불변 시스템을 자율 시스템이라고 하고, 시간 변화 시스템을 비자율 시스템이라고 한다.
- 자율 시스템은 외부 입력이 없는 시스템이다.
- **자율 시스템은 외부 입력이 없는 시간 불변 시스템이다.**

### 특징
- 자율 시스템: 시스템의 동역학이 시간에 독립적이며 외부 입력이 없다.
- 비자율 시스템: 시스템의 동역학이 시간에 따라 변화하거나 외부 입력이 있다.

## #16 자율 시스템의 평형점
### 선형 자율 시스템
- Autonomous System : $\dot{x} = Ax$ or $\dot{x} = f(x)$, $x \in \mathbb{R}^n$
- $x_s \in \mathbb{R}^n$가 평형점(equilibrium point, steady state, singular point)이 되기 위한 조건:
  - $Ax_s = 0$ 또는 $f(x_s) = 0$
  - 즉, $\dot{x} = 0$ at $x = x_s$

### 평형점의 의미
- 평형점에서는 시스템의 상태 변화율이 0이다.
- 선형 시스템의 경우 $Ax_s = 0$을 만족하는 $x_s$가 평형점이다.
- 비선형 시스템의 경우 $f(x_s) = 0$을 만족하는 $x_s$가 평형점이다.

## #21 선형 시스템의 해의 특성
### 해의 유일성
- Solution is unique: each initial condition produces a different trajectory.
- 해는 유일하다: 각 초기 조건마다 서로 다른 궤적을 생성한다.

### 초기 조건에 대한 연속 의존성
- Solution is continuously dependent on initial conditions for every finite t.
- 해는 모든 유한 시간 t에 대해 초기 조건에 연속적으로 의존한다.

### 주기적 해의 특성
- If there is one periodic solution, there is an infinite set of periodic solutions (there is no isolated closed solution).
- 하나의 주기적 해가 존재하면, 무한한 수의 주기적 해가 존재한다 (고립된 닫힌 해는 없다).

## #24 비선형 자율 시스템의 해의 존재성
### 해가 존재하지 않는 경우
- Solution may not exist, even locally.
- 해가 존재하지 않을 수 있다 (지역적으로도).

### 예시: $\dot{x} = -\text{sgn}(x)$, $x(0) = 0$
- The solution is chattering, because $\dot{x} = 1$, $\dot{x} = -1$.
- Therefore no differentiable function satisfying the equation exists.
- 해가 진동(chattering)하는데, 이는 $\dot{x} = 1$, $\dot{x} = -1$이기 때문이다.
- 따라서 방정식을 만족하는 미분 가능한 함수는 존재하지 않는다.

### 의미
- 비선형 시스템은 선형 시스템과 달리 해가 항상 존재하지 않을 수 있다.
- 특히 불연속적인 비선형성(예: 부호 함수)이 있는 경우 해의 존재성이 보장되지 않는다.

## #25 비선형 시스템의 해의 전역적 존재성
### 해가 전역적으로 존재하지 않는 경우
- Solution may not exist globally.
- 해가 전역적으로 존재하지 않을 수 있다.

### 예시: $\dot{x} = 1 + x^2$
- $\dot{x} = 1 + x^2$
- $x = \tan(t + x)$
- $t = \pi/2$일 때 $x = \infty$가 된다.
- 해가 유한 시간 내에 발산한다.

### 의미
- 비선형 시스템의 해는 유한 시간 내에 발산할 수 있다.
- 이는 선형 시스템과 달리 비선형 시스템의 중요한 특징 중 하나이다.
- 해의 존재성을 분석할 때는 지역적 존재성뿐만 아니라 전역적 존재성도 고려해야 한다.

## #26 비선형 시스템의 해의 유일성
### 해가 유일하지 않은 경우
- Solution may not be unique.
- 해가 유일하지 않을 수 있다.

### 예시: $\dot{x} = 3x^{2/3}$, $x(0) = 0$
- $x(t) = 0$은 해이다.
- $x(t) = t^3$도 해이다.
- 따라서 초기 조건 $x(0) = 0$에 대해 두 개의 서로 다른 해가 존재한다.

### 의미
- 비선형 시스템은 선형 시스템과 달리 해가 유일하지 않을 수 있다.
- 이는 비선형 시스템의 중요한 특징 중 하나이다.
- 해의 유일성을 보장하기 위해서는 추가적인 조건(예: Lipschitz 조건)이 필요할 수 있다.

## #27 평형점의 유일성
### 평형점이 유일하지 않은 경우
- Equilibrium point is not necessarily unique.
- 평형점이 반드시 유일하지는 않다.

### 예시: 진자 시스템
- $\ddot{y} + \dot{y} + \sin y = 0$
- 상태 변수 변환: $x_1 = y$, $x_2 = \dot{y}$
- 평형점: $x_1 = n\pi$ (n = 0, 1, 2, ...), $x_2 = 0$
- 즉, 무한히 많은 평형점이 존재한다: $x_s = [n\pi \ 0]^T$, n = 0, 1, 2, ...
- 각 평형점은 진자가 수직 아래(nπ가 짝수) 또는 위(nπ가 홀수)에 정지해 있는 상태를 나타낸다.

### 의미
- 비선형 시스템은 여러 개의 평형점을 가질 수 있다.
- 각 평형점은 서로 다른 특성(안정성, 불안정성 등)을 가질 수 있다.
- 평형점 분석 시 모든 평형점을 고려해야 한다. 