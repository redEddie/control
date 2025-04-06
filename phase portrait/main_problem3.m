function main()
    % 시스템 정의
    syms x x_dot

    % van der Pol 방정식
    % x_ddot + 0.2(x^2-1)x_dot + x = 0
    % 이를 1차 미분 방정식 시스템으로 변환:
    % x_dot = y
    % y_dot = -0.2(x^2-1)y - x
    f1 = x_dot;
    f2 = -0.2*(x^2-1)*x_dot - x;

    % 평형점과 야코비안 행렬 찾기
    [eq_points, J] = find_eq_points(f1, f2, [x, x_dot]);

    % 결과 출력
    fprintf('평형점:\n');
    for i = 1:length(eq_points.x)
        fprintf('평형점 %d: (x, x_dot) = (%f, %f)\n', i, ...
            double(eq_points.x(i)), double(eq_points.x_dot(i)));
    end

    % 각 평형점에서의 안정성 분석
    for i = 1:length(eq_points.x)
        J_at_eq = subs(J, [x, x_dot], [eq_points.x(i), eq_points.x_dot(i)]);
        analyze_stability(J_at_eq, [eq_points.x(i), eq_points.x_dot(i)]);
    end

    % Phase Portrait 그리기
    x_range = [-3 3];
    x_dot_range = [-3 3];
    initial_conditions = [
        -3 -3; -2.5 -2.5; -2 -2; -1.5 -1.5; -1 -1; -0.5 -0.5;
        0 0; 0.5 0.5; 1 1; 1.5 1.5; 2 2; 2.5 2.5; 3 3;
        -3 3; -2 2; -1 1; 1 -1; 2 -2; 3 -3;
        -3 0; -2 0; -1 0; 0 -3; 0 -2; 0 -1;
        0 1; 0 2; 0 3; 1 0; 2 0; 3 0;
        -2.5 1.5; -1.5 2.5; -0.5 1.5; 1.5 -0.5; 2.5 -1.5;
        -2 1; -1 2; 1 -2; 2 -1;
        -1.5 0.5; -0.5 1.5; 0.5 -1.5; 1.5 -0.5;
        -1 0.5; -0.5 1; 0.5 -1; 1 -0.5
    ];
    
    % van der Pol 시스템 정의
    system = @(t,x) [x(2); -0.2*(x(1)^2-1)*x(2) - x(1)];
    figure;
    plot_phase_portrait(system, x_range, x_dot_range, initial_conditions);
    
    % 평형점 표시
    hold on;
    for i = 1:length(eq_points.x)
        plot(double(eq_points.x(i)), double(eq_points.x_dot(i)), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    end
    hold off;
    
    % 그래프 제목 설정
    title('van der Pol 방정식의 위상 평면도');
    xlabel('x');
    ylabel('x_dot');
end 