<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="<c:url value='/css/estilos.css'/>">
</head>
<body>
    <h1>Iniciar Sesión</h1>

    <c:if test="${not empty errorLogin}">
        <div style="background:#ffe0e0; color:red; padding:10px;
                    border-radius:4px; margin-bottom:15px;">
            ${errorLogin}
        </div>
    </c:if>

    <form method="post" action="<c:url value='/login'/>">
        <label>Usuario:
            <input type="text" name="username" required>
        </label><br>
        <label>Contraseña:
            <input type="password" name="password" required>
        </label><br>
        <button type="submit">Entrar</button>
    </form>
</body>
</html>