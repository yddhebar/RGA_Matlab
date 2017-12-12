%....rga code..
%...Developed by Yashesh Dhebar......
clear all
close all
clc

%...Parameters...
opt = input_parameters();


for run = 1:opt.max_runs
    fprintf('run = %d\n',run);
    rng(run,'twister');%..seeding the random number generator..
    best_value = zeros(opt.max_gen,1);
    parent_pop = initialize_pop(opt);
    parent_pop = evaluate_pop(parent_pop,opt);
    for gen = 1:opt.max_gen
        fprintf('gen = %d',gen);
        child_pop = selection(parent_pop,opt);
        child_pop = crossover_pop(child_pop,opt);
        child_pop = mutation_pop(child_pop,opt);
        child_pop = evaluate_pop(child_pop,opt);
        parent_pop = child_pop;
        best_value(gen) = min(child_pop(:,(opt.n_var + opt.n_cons + 1)));
        fprintf('\t best_value = %f\n',best_value(gen));
    end
end

all_gens = [1:opt.max_gen]';
plot(all_gens,best_value);
title('Best Value Vs generation');
xlabel('Generation');
ylabel('Best Fitness');


