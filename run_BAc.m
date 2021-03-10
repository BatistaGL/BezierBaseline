% Runs a baseline correction analysis

% addpath('Your_files folder'); add path to library
[y, x] = load_nova(argv(){1});
[r, c] = BAc_treat_func(x, y);
file = argv(){1}(1:end - 4);
save([file ".rBAc"], 'r', '-ascii');
save([file ".cBAc"], 'c', '-ascii');
