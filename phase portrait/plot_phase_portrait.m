function plot_phase_portrait(system, x1_range, x2_range, initial_conditions)
    % 격자 생성
    [X1, X2] = meshgrid(linspace(x1_range(1), x1_range(2), 20), ...
                       linspace(x2_range(1), x2_range(2), 20));
    
    % 각 격자점에서의 벡터장 계산
    U = zeros(size(X1));
    V = zeros(size(X2));
    for i = 1:numel(X1)
        dx = system(0, [X1(i); X2(i)]);
        U(i) = dx(1);
        V(i) = dx(2);
    end
    
    % 벡터 정규화 (range에 비례하는 크기로 조정)
    range_size = max(x1_range(2) - x1_range(1), x2_range(2) - x2_range(1));
    scale_factor = 1* range_size / 30; % range가 30일 때 1의 비율
    L = sqrt(U.^2 + V.^2);
    U_unit = U ./ L * scale_factor;
    V_unit = V ./ L * scale_factor;
    
    % NaN 방지 (정지점에서 0/0 문제)
    U_unit(isnan(U_unit)) = 0;
    V_unit(isnan(V_unit)) = 0;
    
    % 균일한 길이의 벡터장 그리기
    quiver(X1, X2, U_unit, V_unit, 'AutoScale', 'off', 'Color', [0.5 0.5 0.5]);
    hold on;
    
    % 초기 조건이 주어지지 않은 경우 기본값 설정
    if nargin < 4
        initial_conditions = [1 1; 2 2; -1 -1; -1 1; 1 -1];
    end
    
    % 초기 조건에서 시작하는 궤적 그리기
    for i = 1:size(initial_conditions, 1)
        [~, x] = ode45(system, [0 5], initial_conditions(i,:));
        plot(x(:,1), x(:,2), 'LineWidth', 0.8, 'Color', [0.7 0 0]); % 어두운 붉은색 사용
    end
    
    % 그래프 설정
    title('Phase Portrait');
    xlabel('x_1');
    ylabel('x_2');
    grid on;
    axis([x1_range x2_range]);
    hold off;
end 