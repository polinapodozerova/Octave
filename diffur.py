import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

def runge_kutta4(f, t0, y0, h, num_steps):
    t = np.zeros(num_steps + 1)
    y = np.zeros((num_steps + 1, len(y0)))
    t[0] = t0
    y[0] = y0

    for i in range(num_steps):
        k1 = f(t[i], y[i])
        k2 = f(t[i] + h/2, y[i] + h/2 * k1)
        k3 = f(t[i] + h/2, y[i] + h/2 * k2)
        k4 = f(t[i] + h, y[i] + h * k3)
        y[i+1] = y[i] + h/6 * (k1 + 2*k2 + 2*k3 + k4)
        t[i+1] = t[i] + h

    return t, y

# Определение системы дифференциальных уравнений
def f(t, y):
    x, y, z = y[0], y[1], y[2]
    dx = 10 * (y - x)
    dy = x * (28 - z) - y
    dz = x * y - 8/3 * z
    return np.array([dx, dy, dz])

# Задание начальных условий и параметров метода
t0 = 0
y0 = np.array([0, 1, 20])
h = 0.01 # величина шага
num_steps = 1000

t, y = runge_kutta4(f, t0, y0, h, num_steps)

plt.plot(t, y[:, 0], label='x')
plt.plot(t, y[:, 1], label='y')
plt.plot(t, y[:, 2], label='z')
plt.xlabel('t')
plt.ylabel('Values')
plt.legend()
plt.grid(True)
plt.show()
#################################
t_span = (0, 10)
solution = solve_ivp(f, t_span, y0, dense_output=True)

t_eval = np.linspace(t_span[0], t_span[1], 1000)
y_eval = solution.sol(t_eval)

plt.plot(t_eval, y_eval[0], label='x')
plt.plot(t_eval, y_eval[1], label='y')
plt.plot(t_eval, y_eval[2], label='z')
plt.xlabel('t')
plt.ylabel('Values')
plt.legend()
plt.grid(True)
plt.show()