
opciones = ['Opción 1: generar un archivo con los promedios de cada alumno.',
			'Opción 2: mostrar inasistencias totales de cada alumno.',
			'Opción 3: mostrar alumnos que aprobaron el curso.',
			'Opción 4: salir del programa.'
			]

def mostrar_prom(datos)
	
	noti = []
	file = File.open(datos, 'r')
	notas = file.readlines
	file.close
	notas = notas.join.split
	notas = notas.map do |i|
		i.gsub(",","")
	end
	notas.each_slice(6) do |i|
		noti.push(i)
	end

	puts "\nOpción 1: Generar archivo con promedios.\n\n"

	promedios = File.new('promedios.txt', 'w')
	noti.each do |i|
		suma = 0.0
		cuenta = 0.0
		i.each do |e|
			if e.to_i > 0
				cuenta += 1
				suma += e.to_i

			end
		end
		promedios.puts "#{i[0]} tiene promedio igual a #{suma/cuenta}"
	end
	puts 'Archivo generado, para revisarlo abra el archivo "promedios.txt".'
	puts 'Nota: los promedios sólo consideran las calificaciones en donde el alumno estuvo presente.'
	promedios.close
end

def inasistencias(datos)
	noti = []
	file = File.open(datos, 'r')
	notas = file.readlines
	file.close
	notas = notas.join.split
	notas = notas.map do |i|
		i.gsub(",","")
	end

	puts "\nOpción 2: Inasistencias\n\n"
	notas.each_slice(6) do |i|
		noti.push(i)
	end

	noti.each do |i|
		suma = 0
		i.each do |e|
			if e == "A"
				suma += 1
			end
		end
		if suma == 1
			puts "#{i[0]} tiene #{suma} inasistencia."
		else
			puts "#{i[0]} tiene #{suma} inasistencias."
		end
	end

end

def aprobados(datos,minimo=5)

	noti = []
	file = File.open(datos, 'r')
	notas = file.readlines
	file.close
	notas = notas.join.split
	notas = notas.map do |i|
		i.gsub(",","")
	end
	
	notas.each_slice(6) do |i|
		noti.push(i)
	end

	puts "\nLos alumnos que han aprobado (con nota mayor a #{minimo}) fueron los siguientes:\n\n"
	noti.each do |i|
		suma = 0.0
		cuenta = 0.0
		i.each do |e|
			if e.to_i > 0
				cuenta += 1
				suma += e.to_i
			end
		end
		if suma/cuenta >= minimo
			puts "#{i[0]} con promedio igual a #{suma/cuenta}"
		end
	end

end



seleccion = 0
puts ""
while seleccion != 4
	puts "Ingrese una de las siguientes acciones:"
	puts "(sólo ingrese el número correspondiente. No incluya letras)\n\n"
	puts opciones
	seleccion = gets.chomp.to_i

	while seleccion <1 or seleccion >4
		puts "\nDebe ingresar una opción 1 y 4, de acuerdo a las siguientes posibilidades:"
		puts opciones
		seleccion = gets.chomp.to_i
	end

	case seleccion

	when 1
		mostrar_prom('notas.csv')

	when 2
		inasistencias('notas.csv')

	when 3
		umbral = -1.0
		puts "\nOpción 3: Alumnos aprobados"
		puts "\nIndique la calificación promedio mínima para aprobar:"
		umbral = gets.chomp.to_f

		while umbral < 1 or umbral > 10
			puts "\nLa nota mínima para aprobar debe ser un número entre 1 y 10"
			umbral = gets.chomp.to_f
		end
		aprobados('notas.csv',umbral)

	end

	puts "\n¿Qué más quiere hacer?" if seleccion != 4

end

puts "\nSeleccionó alternativa 4.\nSe cierra el programa.\n"