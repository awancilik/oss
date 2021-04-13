Imports System.Data.SqlClient

<Serializable()> Public Class MyGroupMemberList
    Inherits Csla.BusinessListBase(Of MyGroupMemberList, MyGroupMember)

#Region " Business Methods "

    Public Function GetItem(ByVal memberId As String) As MyGroupMember
        For Each item As MyGroupMember In Me
            If Trim(item.UserId).Equals(Trim(memberId)) Then
                Return item
            End If
        Next
        Return Nothing
    End Function

    Public Sub Assign(ByVal memberId As String, ByVal throwOnExists As Boolean)
        If Contains(memberId) Then
            If throwOnExists Then
                Throw New InvalidOperationException("User tersebut sudah termasuk ke group ini")
            End If
        Else
            Dim child As MyGroupMember = MyGroupMember.NewGroupMember(Trim(memberId))
            If child Is Nothing Then
                'Throw New DataNotExistsException("User", memberId)
            Else
                Me.Add(child)
            End If
        End If
    End Sub
    Public Sub Assign(ByVal memberId As String)
        Assign(memberId, True)
    End Sub

    Public Overloads Function Remove(ByVal memberId As String) As Boolean
        Dim result As Boolean = False
        For Each item As MyGroupMember In Me
            If UCase(Trim(item.UserId)).Equals(UCase(Trim((memberId)))) Then
                result = MyBase.Remove(item)
                Exit For
            End If
        Next
        Return result
    End Function

    Public Overloads Function Contains(ByVal memberId As String) As Boolean
        For Each item As MyGroupMember In Me
            If item.UserId.Trim.Equals(memberId.Trim) Then
                Return True
            End If
        Next
        Return False
    End Function

    Public Overloads Function ContainsDeleted(ByVal memberId As String) As Boolean
        For Each item As MyGroupMember In DeletedList
            If item.UserId.Equals(memberId) Then
                Return True
            End If
        Next
        Return False
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function NewGroupMemberList() As MyGroupMemberList
        Return New MyGroupMemberList
    End Function

    Friend Shared Function GetGroupMemberList(ByVal dr As Csla.Data.SafeDataReader) As MyGroupMemberList
        Return New MyGroupMemberList(dr)
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
            Add(MyGroupMember.GetGroupMember(dr))
        End While
        RaiseListChangedEvents = True

    End Sub

    Friend Sub Update(ByVal tr As SqlTransaction, ByVal parent As MyGroup)

        RaiseListChangedEvents = False
        For Each item As MyGroupMember In DeletedList
            item.DeleteSelf(parent)
        Next
        DeletedList.Clear()

        For Each item As MyGroupMember In Me
            If item.IsNew Then
                item.Insert(tr, parent)
            End If
        Next
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

