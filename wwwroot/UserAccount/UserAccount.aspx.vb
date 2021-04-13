Imports Bisnisobjek
Imports DevExpress.Web.ASPxGridView

Partial Class UserAccount_UserAccount
    Inherits System.Web.UI.Page

    Protected Sub UserListDatasource_DeleteObject(ByVal sender As Object, ByVal e As Csla.Web.DeleteObjectArgs) Handles UserListDatasource.DeleteObject
        MyUser.DeleteUser(e.OldValues("UserId"))
    End Sub

    Protected Sub UserListDatasource_InsertObject(ByVal sender As Object, ByVal e As Csla.Web.InsertObjectArgs) Handles UserListDatasource.InsertObject
        Dim obj As MyUser = MyUser.NewUser
        Dim gv As ASPxGridView = MasterGridView

        If obj IsNot Nothing Then
            Csla.Data.Map(e.Values, obj)
            If obj.IsSavable Then
                obj.Save()
            Else
                Throw New Exception(obj.BrokenRulesCollection.ToString)
            End If
        End If
    End Sub

    Protected Sub UserListDatasource_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles UserListDatasource.SelectObject
        e.BusinessObject = MyUserInfoList.GetList
    End Sub

    Protected Sub MasterGridView_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles MasterGridView.RowUpdating
        Dim gv As ASPxGridView = MasterGridView
        Dim obj As MyUser = MyUser.GetUser(gv.GetRowValues(gv.EditingRowVisibleIndex, "UserId").ToString.Trim)

        If obj IsNot Nothing Then
            Csla.Data.Map(e.NewValues, obj)
            If obj.IsSavable Then
                Try
                    obj.Save()
                Catch ex As Csla.DataPortalException
                    Throw ex.BusinessException
                Catch ex As Exception
                    Throw New Exception(ex.Message.ToString)
                End Try
            Else
                Throw New Exception(obj.BrokenRulesCollection.ToString)
            End If
        End If
    End Sub
End Class
