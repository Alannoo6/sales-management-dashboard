/*
Commercial Sales Dataset

Author: Agustin Lannoo
Purpose: Extraction of commercial sales data for business performance analysis.
Output: Dataset used in Power BI dashboard.
*/

SELECT
    va.VentaID,
    va.Fecha,

    a.Articulo        AS ArticuloID,
    a.Codigo          AS ArticuloCodigo,
    a.Nombre          AS ArticuloNombre,
    ta.Nombre         AS TipoArticulo,

    c4.Nombre         AS ClasificacionGenero,
    c3.Nombre         AS Genero,
    c5.Nombre         AS ClienteLinea,

    va.ClienteVentas  AS ClienteID,
    cl.Nombre         AS ClienteNombre,
    cl.Domicilio,
    cl.Localidad,
    pr.Nombre         AS Provincia,
    pa.Nombre         AS Pais,

    va.Vendedor       AS VendedorID,
    v.Nombre          AS VendedorNombre,

    va.Division       AS DivisionID,
    d.Nombre          AS DivisionNombre,

    va.SucursalImpositiva,
    va.CantidadVendidaUnidadesStock,
    va.ImporteVendidoNeto

FROM VentasArticulos va

INNER JOIN Clientes cl
    ON cl.Cliente = va.ClienteVentas

INNER JOIN Vendedores v
    ON v.Vendedor = va.Vendedor

INNER JOIN Divisiones d
    ON d.Division = va.Division

INNER JOIN Articulos a
    ON a.ArticuloInterno = va.Articulo

INNER JOIN TiposArticulos ta
    ON ta.TipoArticulo = a.Tipo

INNER JOIN Provincias pr
    ON pr.Provincia = cl.Provincia

INNER JOIN Paises pa
    ON pa.Pais = cl.Pais

INNER JOIN Clasificaciones4Articulos c4
    ON a.Clasificacion4 = c4.Clasificacion4

INNER JOIN Clasificaciones3Articulos c3
    ON a.Clasificacion3 = c3.Clasificacion3

INNER JOIN Clasificaciones5Articulos c5
    ON a.Clasificacion5 = c5.Clasificacion5

WHERE va.Fecha > '2020-12-31';
