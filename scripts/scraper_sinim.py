from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
import time

def scrapear_sinim():
    """
    Automatiza la generación de reportes en SINIM (Ficha Comunal).
    Maneja selectores dinámicos y dependientes (Región -> Provincia -> Comuna).
    """
    
    # Configuración del navegador
    options = webdriver.ChromeOptions()
    # options.add_argument("--headless") # Descomentar para ejecutar en segundo plano
    options.add_argument("--start-maximized")
    
    print("Iniciando navegador...")
    driver = webdriver.Chrome(options=options)
    
    try:
        # 1. Cargar la página
        url = "https://datos.sinim.gov.cl/ficha_comunal.php"
        driver.get(url)
        wait = WebDriverWait(driver, 20) # Espera máxima de 20 segundos
        
        print(f"Cargando {url}...")

        # 2. Abrir Modal "Impresión Avanzada"
        # Buscamos el enlace que contiene el texto exacto
        btn_impresion = wait.until(EC.element_to_be_clickable(
            (By.XPATH, "//a[contains(text(), 'Impresión Avanzada')]")
        ))
        btn_impresion.click()
        print("Modal 'Opciones de impresión' abierto.")

        # Esperar a que el modal sea visible
        # Nota: Los selectores a continuación son inferidos para componentes tipo "Select2" o "Chosen"
        # que usan inputs de texto para filtrar opciones.
        
        # 3. Seleccionar REGIÓN: METROPOLITANA
        print("Seleccionando Región...")
        
        # Buscamos el primer input dentro del modal (usualmente corresponde a Región)
        # Usamos XPATH para encontrar el input dentro del contenedor de opciones
        input_region = wait.until(EC.element_to_be_clickable(
            (By.XPATH, "(//div[@class='modal-body']//input[@type='text'])[1]")
        ))
        input_region.click()
        input_region.send_keys("METROPOLITANA")
        time.sleep(1) # Esperar a que el filtro de JS procese
        input_region.send_keys(Keys.ENTER)
        
        print("Región seleccionada. Esperando carga de provincias...")
        time.sleep(2) # Espera crítica para AJAX de provincias

        # 4. Seleccionar PROVINCIA: SANTIAGO
        print("Seleccionando Provincia...")
        
        input_provincia = wait.until(EC.element_to_be_clickable(
            (By.XPATH, "(//div[@class='modal-body']//input[@type='text'])[2]")
        ))
        input_provincia.click()
        input_provincia.send_keys("SANTIAGO")
        time.sleep(1)
        input_provincia.send_keys(Keys.ENTER)
        
        print("Provincia seleccionada. Esperando carga de comunas...")
        time.sleep(2) # Espera crítica para AJAX de comunas

        # 5. Seleccionar COMUNA: TODOS LOS MUNICIPIOS
        print("Seleccionando Comuna...")
        
        input_comuna = wait.until(EC.element_to_be_clickable(
            (By.XPATH, "(//div[@class='modal-body']//input[@type='text'])[3]")
        ))
        input_comuna.click()
        # Nota: A veces "Todos" es una opción especial, o simplemente seleccionamos todo
        # Si queremos escribir "TODOS":
        input_comuna.send_keys("TODOS LOS MUNICIPIOS") 
        time.sleep(1)
        input_comuna.send_keys(Keys.ENTER)
        
        print("Comuna seleccionada.")

        # 6. Click en "Vista Previa"
        print("Generando reporte...")
        btn_vista_previa = wait.until(EC.element_to_be_clickable(
            (By.XPATH, "//button[contains(text(), 'Vista Previa')]")
        ))
        btn_vista_previa.click()

        # 7. Manejo de Nueva Ventana (Reporte)
        # Esperar a que haya 2 ventanas (la original + el reporte)
        wait.until(EC.number_of_windows_to_be(2))
        
        # Cambiar el foco a la nueva ventana
        ventanas = driver.window_handles
        driver.switch_to.window(ventanas[-1])
        
        print(f"Reporte generado en URL: {driver.current_url}")
        
        # Aquí podrías extraer el HTML de la tabla
        # html_tabla = driver.page_source
        # ... procesar con pandas ...

        time.sleep(5) # Pausa para ver el resultado visualmente

    except Exception as e:
        print(f"❌ Error durante el proceso: {e}")
        # Captura de pantalla en caso de error para debug
        driver.save_screenshot("error_sinim.png")
        
    finally:
        print("Cerrando navegador...")
        driver.quit()

if __name__ == "__main__":
    # Asegúrate de tener instalado: pip install selenium webdriver-manager
    scrapear_sinim()
