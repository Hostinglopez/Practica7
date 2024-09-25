require 'rails_helper'

RSpec.feature "Estudiantes", type: :feature do
  #pending "add some scenarios (or delete) #{__FILE__}"
   scenario "User adds a new estudiante" do
    visit new_estudiante_path  # Asegúrate de que esta ruta sea correcta

   
    fill_in "Nombre", with: "Juan"                  
    fill_in "Apellido", with: "Pérez"                
    fill_in "Carrera", with: "Ingeniería"            
    fill_in "Carnet", with: "20231001"                

    click_button "Create Estudiante"  # Cambia el texto del botón según tu aplicación

    expect(page).to have_content("Estudiante was successfully created.") 
    expect(Estudiante.count).to eq(1)  
    expect(Estudiante.last.nombres).to eq("Juan")  
    expect(Estudiante.last.apellidos).to eq("Pérez")  
    expect(Estudiante.last.carrera).to eq("Ingeniería")  
    expect(Estudiante.last.carnet).to eq("20231001") 
  end
  
     scenario "User clicks back link and is redirected to main page" do
      visit new_estudiante_path  
      click_link "Back"  
      expect(current_path).to eq(estudiantes_path) 
      expect(page).to have_content("Estudiantes") 
  end
  
end
