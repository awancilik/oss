Imports System.Data.SqlClient

<Serializable()> Public Class MyGroupRoleList
    Inherits Csla.BusinessListBase(Of MyGroupRoleList, MyGroupRole)

#Region " Business Methods "

    Public Function GetItem(ByVal roleId As String) As MyGroupRole
        For Each item As MyGroupRole In Me
            If Trim(item.RoleId).Equals(Trim(roleId)) Then
                Return item
            End If
        Next
        Return Nothing
    End Function

    Public Sub Assign(ByVal roleId As String, ByVal throwOnExists As Boolean)
        If Contains(roleId) Then
            If throwOnExists Then
                Throw New InvalidOperationException("Hak Akses tersebut sudah termasuk ke group ini")
            End If
        Else
            Dim child As MyGroupRole = MyGroupRole.NewGroupRole(Trim(roleId))
            If child Is Nothing Then
                'Throw New DataNotExistsException("Role", roleId)
            Else
                Me.Add(child)
            End If
        End If
    End Sub
    Public Sub Assign(ByVal roleId As String)
        Assign(roleId, True)
    End Sub

    Public Overloads Function Remove(ByVal roleId As String) As Boolean
        Dim result As Boolean = False
        For Each item As MyGroupRole In Me
            If UCase(Trim(item.RoleId)).Equals(UCase(Trim((roleId)))) Then
                result = MyBase.Remove(item)
                Exit For
            End If
        Next
        Return result
    End Function

    Public Overloads Function Contains(ByVal roleId As String) As Boolean
        For Each item As MyGroupRole In Me
            If item.RoleId.Trim.Equals(roleId.Trim) Then
                Return True
            End If
        Next
        Return False
    End Function

    Public Overloads Function ContainsDeleted(ByVal roleId As String) As Boolean
        For Each item As MyGroupRole In DeletedList
            If item.RoleId.Equals(roleId) Then
                Return True
            End If
        Next
        Return False
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function NewGroupRoleList() As MyGroupRoleList
        Return New MyGroupRoleList
    End Function

    Friend Shared Function GetGroupRoleList(ByVal dr As Csla.Data.SafeDataReader) As MyGroupRoleList
        Return New MyGroupRoleList(dr)
    End Function

    Private Sub New()
        MarkAsChild()
    End Sub

    Private Sub New(ByVal dr As Csla.Data.SafeDataReader)
        MarkAsChild()
        Fetch(dr)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dr As Csla.Data.SafeDataReader)

        RaiseListChangedEvents = False
        While dr.Read
            Add(MyGroupRole.GetGroupRole(dr))
        End While
        RaiseListChangedEvents = True

    End Sub

    Friend Sub Update(ByVal tr As SqlTransaction, ByVal parent As MyGroup)

        RaiseListChangedEvents = False
        For Each item As MyGroupRole In DeletedList
            item.DeleteSelf(parent)
        Next
        DeletedList.Clear()

        For Each item As MyGroupRole In Me
            If item.IsNew Then
                item.Insert(tr, parent)
            End If
        Next
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

