using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Id, Nombre, Apellido, Email, Telefono, Contrasena, IdRol, Activo FROM Usuarios");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Contrasena = (string)datos.Lector["Contrasena"];
                    aux.Activo = (bool)datos.Lector["Activo"];

                    aux.Rol = new Rol();
                    aux.Rol.Id = (int)datos.Lector["IdRol"];

                    if (!(datos.Lector["Nombre"] is DBNull))
                        aux.Nombre = (string)datos.Lector["Nombre"];

                    if (!(datos.Lector["Apellido"] is DBNull))
                        aux.Apellido = (string)datos.Lector["Apellido"];

                    if (!(datos.Lector["Telefono"] is DBNull))
                        aux.Telefono = (string)datos.Lector["Telefono"];

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Usuario> listarAdministradores()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Id, Nombre, Apellido, Email, Telefono, Contrasena, IdRol, Activo FROM Usuarios WHERE IdRol = 1 AND Activo = 1");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Contrasena = (string)datos.Lector["Contrasena"];
                    aux.Activo = (bool)datos.Lector["Activo"];

                    aux.Rol = new Rol();
                    aux.Rol.Id = (int)datos.Lector["IdRol"];

                    if (!(datos.Lector["Nombre"] is DBNull))
                        aux.Nombre = (string)datos.Lector["Nombre"];

                    if (!(datos.Lector["Apellido"] is DBNull))
                        aux.Apellido = (string)datos.Lector["Apellido"];

                    if (!(datos.Lector["Telefono"] is DBNull))
                        aux.Telefono = (string)datos.Lector["Telefono"];

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Usuario> listarClientes()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Id, Nombre, Apellido, Email, Telefono, Contrasena, IdRol, Activo FROM Usuarios WHERE IdRol = 2 AND Activo = 1");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Contrasena = (string)datos.Lector["Contrasena"];
                    aux.Activo = (bool)datos.Lector["Activo"];

                    aux.Rol = new Rol();
                    aux.Rol.Id = (int)datos.Lector["IdRol"];

                    if (!(datos.Lector["Nombre"] is DBNull))
                        aux.Nombre = (string)datos.Lector["Nombre"];

                    if (!(datos.Lector["Apellido"] is DBNull))
                        aux.Apellido = (string)datos.Lector["Apellido"];

                    if (!(datos.Lector["Telefono"] is DBNull))
                        aux.Telefono = (string)datos.Lector["Telefono"];

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void agregar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Usuarios (Nombre, Apellido, Email, Telefono, Contrasena, IdRol, Activo) VALUES (@nombre, @apellido, @email, @telefono, @contrasena, @idRol, 1)");

                datos.setearParametro("@nombre", (object)nuevo.Nombre ?? DBNull.Value);
                datos.setearParametro("@apellido", (object)nuevo.Apellido ?? DBNull.Value);
                datos.setearParametro("@email", nuevo.Email);
                datos.setearParametro("@telefono", (object)nuevo.Telefono ?? DBNull.Value);
                datos.setearParametro("@contrasena", nuevo.Contrasena);
                datos.setearParametro("@idRol", nuevo.Rol.Id);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void modificar(Usuario user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Usuarios SET Nombre = @nombre, Apellido = @apellido, Email = @email, Telefono = @telefono, IdRol = @idRol, Activo = @activo WHERE Id = @id");

                datos.setearParametro("@nombre", (object)user.Nombre ?? DBNull.Value);
                datos.setearParametro("@apellido", (object)user.Apellido ?? DBNull.Value);
                datos.setearParametro("@email", user.Email);
                datos.setearParametro("@telefono", (object)user.Telefono ?? DBNull.Value);
                datos.setearParametro("@idRol", user.Rol.Id);
                datos.setearParametro("@activo", user.Activo);
                datos.setearParametro("@id", user.Id);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void eliminarLogico(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Usuarios SET Activo = 0 WHERE Id = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
