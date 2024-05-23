clc; clear all; close all;

while true
    disp('Ingrese una opcion: ');
    disp('1. Simpson 1/3');
    disp('2. Integral definida');
    disp('3. Integral indefinida');
    disp('4. Suma de Riemann');
    disp('5. Salir');
    opt = input('');

    if opt == 5
        disp('Saliendo del programa...');
        break;
    end

    switch opt
        case 1
            clear all; close all; clc
            format long;

            fun = input('Ingresa la funcion f(x): ', 's');
            f = inline(fun);
            n = 1;
            while mod(n, 2) ~= 0
                n = input('Ingrese el numero de subintervalos: ');
                if mod(n, 2) ~= 0
                    disp('El numero de subintervalos debe ser par, pulse una tecla para continuar');
                    pause;
                end
            end
            a = input('Ingrese el limite inferior de la integral: ');
            b = input('Ingrese el limite superior de la integral: ');

            h = (b - a) / n;

            sumai = 0;
            sumap = 0;
            for i = 1:2:n-1
                sumai = sumai + feval(f, h * i + a);
            end
            for i = 2:2:n-2
                sumap = sumap + feval(f, h * i + a);
            end
            int = (h / 3) * (feval(f, a) + 4 * sumai + 2 * sumap + feval(f, b));
            disp(['El resultado de la integral es ' num2str(int)]);
            
        case 2
            f = input('Ingresa la funcion f(x): ', 's');
            f = inline(f);
            li = input('Ingrese el limite inferior de la integral: ');
            ls = input('Ingrese el limite superior de la integral: ');
            intd = int(f, li, ls);  % Utiliza 'integral' en lugar de 'int'
            disp(['El resultado de la integral definida es ' num2str(intd)]);
            
        case 3
            syms x
            f = input('Ingrese la funcion f(x): ', 's');
            f = str2func(['@(x)', f]);  % Convierte la cadena a una función anónima
            intg = int(f, x);
            disp(['El resultado de la integral indefinida es ' char(intg)]);
            
        case 4
            syms x;
            f = input('ingrese la funcion: ');
            a = input('ingrese el inicio del intervalo: ');
            b = input('ingrese el final del intervalo: ');
            n = input('ingrese la cantidad de subintervalos: ');
            dx = (b-a)/n;
            resultado = zeros(1,n); %creacion de un vector
            i = 0;
            fs = subs(f,x,(a+i*dx));
            fr = fs*dx;
            resultado(1) = fr
            
            for i=1:n;
                fs=subs(f,x,(a+i*dx));
                fr=fs*dx;
                resultado(i+1)=resultado(i)+fr;
            end
            r=resultado(1,n)
            fprintf('el area bajo la curva es = %d \n',double(r));
            
            x=a:dx:b;
            bar(x,resultado)
            hold on
            xlabel("y")
            ylabel("area")
            hold off
        otherwise
            disp('Opcion no valida. Intente de nuevo.');
    end
end
