function [eq_points, J] = find_eq_points(f1, f2, vars)
    % 평형점 찾기
    eq_points = solve([f1 == 0, f2 == 0], vars);
    
    % 야코비안 행렬 계산
    J = jacobian([f1; f2], vars);
end 