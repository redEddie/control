function main()
    % 시스템 정의
    syms x1 x2

    % 시스템 방정식
    % x1_dot = x2
    % x2_dot = -sign(x1)
    f1 = x2;
    f2 = -sign(x1);

    % 평형점과 야코비안 행렬 찾기
    [eq_points, J] = find_eq_points(f1, f2, [x1, x2]);

    % 결과 출력
    fprintf('평형점:\n');
    for i = 1:length(eq_points.x1)
        fprintf('평형점 %d: (x1, x2) = (%f, %f)\n', i, ...
            double(eq_points.x1(i)), double(eq_points.x2(i)));
    end

    % 각 평형점에서의 안정성 분석
    for i = 1:length(eq_points.x1)
        J_at_eq = subs(J, [x1, x2], [eq_points.x1(i), eq_points.x2(i)]);
        analyze_stability(J_at_eq, [eq_points.x1(i), eq_points.x2(i)]);
    end

    % Phase Portrait 그리기
    x1_range = [-3 3];
    x2_range = [-3 3];
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
    % 시스템 정의
    system = @(t,x) [x(2); -sign(x(1))];
    figure;
    plot_phase_portrait(system, x1_range, x2_range, initial_conditions);
    
    % 평형점 표시
    hold on;
    for i = 1:length(eq_points.x1)
        plot(double(eq_points.x1(i)), double(eq_points.x2(i)), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    end
    hold off;
    
    % 그래프 제목 설정
    title('x1_dot = x2, x2_dot = -sign(x1) 시스템의 위상 평면도');
    xlabel('x1');
    ylabel('x2');
end 