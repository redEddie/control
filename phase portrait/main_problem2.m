function main()
    % 시스템 정의
    syms x1 x2

    % 시스템 방정식(두 종의 경쟁 관계를 나타내는 로트카-볼테라 방정식의 변형)
    f1 = 14*x1 - 0.5*x1^2 - x1*x2;
    f2 = 16*x2 - 0.5*x2^2 - x1*x2;

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
    x1_range = [-5 30];
    x2_range = [-5 35];
    initial_conditions = [
        -5 -5; -4 -4; -3 -3; -2 -2; -1 -1; 0 0;
        1 1; 2 2; 3 3; 4 4; 5 5; 6 6; 7 7; 8 8; 9 9; 10 10;
        12 12; 14 14; 16 16; 18 18; 20 20; 22 22; 24 24;
        -3 2; 2 -3; -4 3; 3 -4; -2 5; 5 -2;
        5 10; 10 5; 15 20; 20 15; 8 12; 12 8;
        2 8; 8 2; 15 25; 25 15; 18 22; 22 18;
        -1 8; 8 -1; -2 12; 12 -2; -3 15; 15 -3;
        6 16; 16 6; 9 21; 21 9; 11 17; 17 11
    ];
    
    % 방법 1: 상세한 위상 평면도
    system = @(t,x) [14*x(1) - 0.5*x(1)^2 - x(1)*x(2); 16*x(2) - 0.5*x(2)^2 - x(1)*x(2)];
    figure;
    plot_phase_portrait(system, x1_range, x2_range, initial_conditions);
    
    % 평형점 표시
    hold on;
    for i = 1:length(eq_points.x1)
        plot(double(eq_points.x1(i)), double(eq_points.x2(i)), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    end
    hold off;
    
    % 그래프 제목 설정
    title('경쟁 시스템의 위상 평면도');
    xlabel('x_1');
    ylabel('x_2');
end 