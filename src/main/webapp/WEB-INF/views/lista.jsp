<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c"   uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"  %>
<fmt:setLocale value="${sessionScope.locale != null ? sessionScope.locale : 'es'}"/>
<fmt:setBundle basename="messages"/>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title><fmt:message key="app.titulo"/></title>
  <link rel="stylesheet" href="<c:url value='/css/estilos.css'/>">
</head>
<body>
  <h1><fmt:message key="app.titulo"/></h1>

  <%-- Bienvenida y selector de idioma --%>
  <p>
    <fmt:message key="app.bienvenida"/>,
    <strong>${sessionScope.usuarioActual.username}</strong>
    &nbsp;|&nbsp;
    <a href="<c:url value='/idioma?lang=es'/>">Español</a> |
    <a href="<c:url value='/idioma?lang=en'/>">English</a>
    &nbsp;|&nbsp;
    <a href="<c:url value='/logout'/>">Cerrar sesión</a>
  </p>

  <c:if test="${not empty mensaje}">
    <p class="alert-success">${mensaje}</p>
  </c:if>

  <a href="<c:url value='/productos?accion=formulario'/>">
    + <fmt:message key="menu.nuevo"/>
  </a>

  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th><fmt:message key="tabla.nombre"/></th>
        <th><fmt:message key="tabla.categoria"/></th>
        <th><fmt:message key="tabla.precio"/></th>
        <th><fmt:message key="tabla.stock"/></th>
        <th><fmt:message key="tabla.acciones"/></th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="p" items="${productos}" varStatus="s">
        <tr class="${s.index % 2 == 0 ? 'par' : 'impar'}">
          <td>${p.id}</td>
          <td><c:out value="${p.nombre}"/></td>
          <td><c:out value="${p.categoria}"/></td>
          <td>$ ${p.precio}</td>
          <td>${p.stock}</td>
          <td>
            <a href="<c:url value='/productos?accion=editar&id=${p.id}'/>">
              <fmt:message key="btn.editar"/>
            </a> |
            <a href="<c:url value='/productos?accion=eliminar&id=${p.id}'/>"
               onclick="return confirm('¿Eliminar ${p.nombre}?')">
              <fmt:message key="btn.eliminar"/>
            </a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>