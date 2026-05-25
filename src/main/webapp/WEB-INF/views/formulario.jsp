<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>${empty producto ? "Nuevo Producto" : "Editar Producto"}</title>
  <link rel="stylesheet" href="<c:url value='/css/estilos.css'/>">
  <style>
    .alert-error  { background:#ffe0e0; border:1px solid red;
                    padding:10px; margin-bottom:15px; border-radius:4px; }
    .input-error  { border:2px solid red; }
    .campo-error  { color:red; font-size:0.85em; display:block; }
  </style>
</head>
<body>
  <h1>${empty producto ? "Registrar Producto" : "Editar Producto"}</h1>

  <%-- Resumen de errores --%>
  <c:if test="${not empty errores}">
    <div class="alert-error">
      <ul>
        <c:forEach var="e" items="${errores}">
          <li>${e.value}</li>
        </c:forEach>
      </ul>
    </div>
  </c:if>

  <form method="post" action="<c:url value='/productos'/>">
    <c:if test="${not empty producto}">
      <input type="hidden" name="id"     value="${producto.id}">
      <input type="hidden" name="accion" value="actualizar">
    </c:if>
    <c:if test="${empty producto}">
      <input type="hidden" name="accion" value="guardar">
    </c:if>

    <%-- Nombre --%>
    <label>Nombre:
      <input type="text" name="nombre"
             value="<c:out value='${not empty nombre ? nombre : producto.nombre}'/>"
             class="${not empty errores.nombre ? 'input-error' : ''}">
      <c:if test="${not empty errores.nombre}">
        <span class="campo-error">${errores.nombre}</span>
      </c:if>
    </label><br>

    <%-- Categoría --%>
    <label>Categoría:
      <input type="text" name="categoria"
             value="<c:out value='${not empty categoria ? categoria : producto.categoria}'/>">
    </label><br>

    <%-- Precio --%>
    <label>Precio:
      <input type="text" name="precio"
             value="<c:out value='${not empty precio ? precio : producto.precio}'/>"
             class="${not empty errores.precio ? 'input-error' : ''}">
      <c:if test="${not empty errores.precio}">
        <span class="campo-error">${errores.precio}</span>
      </c:if>
    </label><br>

    <%-- Stock --%>
    <label>Stock:
      <input type="text" name="stock"
             value="<c:out value='${not empty stock ? stock : producto.stock}'/>"
             class="${not empty errores.stock ? 'input-error' : ''}">
      <c:if test="${not empty errores.stock}">
        <span class="campo-error">${errores.stock}</span>
      </c:if>
    </label><br>

    <button type="submit">${empty producto ? "Guardar" : "Actualizar"}</button>
    <a href="<c:url value='/productos'/>">Cancelar</a>
  </form>
</body>
</html>