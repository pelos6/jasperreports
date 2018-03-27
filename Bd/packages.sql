CREATE OR REPLACE PACKAGE JASPER_PCK AS

    TYPE cursorJasper IS REF CURSOR;

-----------------------------------------------------------------------------
-- Función encargada de obtener los cursos
-----------------------------------------------------------------------------
    FUNCTION F_OBTENER_CURSOS
    (
        p_id_curso CURSO.ID_CURSO%TYPE
    )
    RETURN cursorJasper;
           
-----------------------------------------------------------------------------
-- Función encargada de obtener los alumnos
-----------------------------------------------------------------------------
    FUNCTION F_OBTENER_ALUMNOS
    (
        p_nif ALUMNO.NIF%TYPE
    )    
    RETURN cursorJasper; 
                
END JASPER_PCK;
/
CREATE OR REPLACE PACKAGE BODY JASPER_PCK AS

-----------------------------------------------------------------------------
-- Función encargada de obtener los cursos
-----------------------------------------------------------------------------
    FUNCTION F_OBTENER_CURSOS
    (
        p_id_curso CURSO.ID_CURSO%TYPE
    )
    RETURN cursorJasper IS
       
        cJasper cursorJasper;
       
    BEGIN
       
        OPEN cJasper FOR 
        SELECT *
        FROM CURSO
        WHERE (p_id_curso IS NULL OR p_id_curso = ID_CURSO)
        ORDER BY NOMBRE;

        RETURN cJasper;
       
    END F_OBTENER_CURSOS;       
          
-----------------------------------------------------------------------------
-- Función encargada de obtener los alumnos
-----------------------------------------------------------------------------
    FUNCTION F_OBTENER_ALUMNOS
    (
        p_nif ALUMNO.NIF%TYPE
    )    
    RETURN cursorJasper IS
       
        cJasper cursorJasper;
       
    BEGIN
       
        OPEN cJasper FOR 
        SELECT *
        FROM ALUMNO
        WHERE (p_nif IS NULL OR p_nif = NIF)
        ORDER BY APELLIDO1, APELLIDO2, NOMBRE;

        RETURN cJasper;
       
    END F_OBTENER_ALUMNOS;
                         
END JASPER_PCK;
/
