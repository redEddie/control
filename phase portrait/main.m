function main()
    % 시스템 정의
    syms x1 x2

    % 시스템 방정식
    f1 = -x1 + x1*x2;
    f2 = -2*x2 + x1*x2;

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

    % Phase Portrait 그리기 (두 가지 방법)
    x1_range = [-1 5];
    x2_range = [-1 5];
    
    % 방법 1: 상세한 위상 평면도
    initial_conditions = [
        -1 -1; -0.8 -0.8; -0.6 -0.6; -0.4 -0.4; -0.2 -0.2;
        -0.8 -0.2; -0.2 -0.8; -0.6 -0.4; -0.4 -0.6;
        0.5 2; 3 1; 1 3; 2 0.5;
        4 2; 2 4; 0.2 1.5; 1.5 0.2;
        0.5 3; 3 0.5; 1 2; 2 1;
        0.3 0.3; 4 4; 0.7 0.7; 1.5 1.5;
        2.5 2.5; 3.5 3.5; 0.4 2.5; 2.5 0.4;
        1.2 3.2; 3.2 1.2; 0.8 2.8; 2.8 0.8;
        0.6 1.8; 1.8 0.6; 1.4 2.6; 2.6 1.4;
        0.9 2.3; 2.3 0.9; 1.6 3.4; 3.4 1.6
    ];
    system = @(t,x) [-x(1) + x(1)*x(2); -2*x(2) + x(1)*x(2)];
    figure;
    plot_phase_portrait(system, x1_range, x2_range, initial_conditions);
    
    % 평형점 표시
    hold on;
    for i = 1:length(eq_points.x1)
        plot(double(eq_points.x1(i)), double(eq_points.x2(i)), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    end
    hold off;

    % 그래프 제목 설정
    title('Lotka-Volterra 시스템의 위상 평면도');
    xlabel('x_1');
    ylabel('x_2');
end 