Imports Bisnisobjek
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxPopupControl

Partial Class UserAccount_UserGroup
    Inherits System.Web.UI.Page

    Private _groupId As String = ""
    Private Const SV_BUSINESS_OBJECT As String = "SS"

#Region " Business Object "

    Private Function GetBusinessObject() As MyGroup
        Dim obj As Object = Session.Item(SV_BUSINESS_OBJECT)
        If obj Is Nothing OrElse Not TypeOf obj Is MyGroup Then
            If String.IsNullOrEmpty(_groupId) Or _groupId = "0" Then
                Dim newobj As MyGroup = MyGroup.NewGroup
                Session.Item(SV_BUSINESS_OBJECT) = newobj
                EditorDetailsView.ChangeMode(DetailsViewMode.Insert)
                Return newobj
            Else
                Dim newobj As MyGroup = MyGroup.GetGroup(_groupId)
                Session.Item(SV_BUSINESS_OBJECT) = newobj
                EditorDetailsView.ChangeMode(DetailsViewMode.ReadOnly)
                Return newobj
            End If
        End If
        Return DirectCast(obj, MyGroup)
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            InvalidateBusinessObject()
            If Not Request.Params("groupId") Is Nothing Then
                If Not String.IsNullOrEmpty(Request.Params("groupId").ToString) Then
                    Dim id As String = Request.Params("groupId").ToString
                    _groupId = id
                    MainMultiview.ActiveViewIndex = "1"
                    EditorDetailsView.ChangeMode(DetailsViewMode.Edit)
                    EditorDetailsView.DataBind()
                Else
                    MainMultiview.ActiveViewIndex = "0"
                End If
            End If
        End If
    End Sub

#End Region

#Region " Data Source "

    Protected Sub GroupListDatasource_DeleteObject(ByVal sender As Object, ByVal e As Csla.Web.DeleteObjectArgs) Handles GroupListDatasource.DeleteObject
        MyGroup.DeleteGroup(e.OldValues("GroupId"))
    End Sub

    Protected Sub GroupListDatasource_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles GroupListDatasource.SelectObject
        e.BusinessObject = MyGroupInfoList.GetList
    End Sub

    Protected Sub GroupDataSource_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles GroupDataSource.SelectObject
        e.BusinessObject = GetBusinessObject()
    End Sub

    Protected Sub GroupRoleListDataSource_DeleteObject(ByVal sender As Object, ByVal e As Csla.Web.DeleteObjectArgs) Handles GroupRoleListDataSource.DeleteObject
        Dim obj As MyGroup = GetBusinessObject()
        obj.Roles.Remove(e.OldValues("RoleId").ToString.Trim)
        obj.Save()
    End Sub

    Protected Sub GroupRoleListDataSource_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles GroupRoleListDataSource.SelectObject
        Dim obj As MyGroup = GetBusinessObject()
        e.BusinessObject = obj.Roles
    End Sub

    Protected Sub GroupMemberDataSource_DeleteObject(ByVal sender As Object, ByVal e As Csla.Web.DeleteObjectArgs) Handles GroupMemberDataSource.DeleteObject
        Dim obj As MyGroup = GetBusinessObject()
        obj.Members.Remove(e.OldValues("UserId").ToString.Trim)
        obj.Save()
    End Sub

    Protected Sub GroupMemberDataSource_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles GroupMemberDataSource.SelectObject
        Dim obj As MyGroup = GetBusinessObject()
        e.BusinessObject = obj.Members
    End Sub

    Protected Sub RoleListDataSource_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles RoleListDataSource.SelectObject
        e.BusinessObject = MyRoleInfoList.GetList
    End Sub

    Protected Sub MemberListDataSource_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles MemberListDataSource.SelectObject
        e.BusinessObject = MyUserInfoList.GetList
    End Sub

#End Region

#Region " Objek "

    Private Sub InvalidateBusinessObject()
        Session.Item(SV_BUSINESS_OBJECT) = Nothing
        Session.Remove(SV_BUSINESS_OBJECT)
    End Sub

#End Region

#Region " Grid View "

    Protected Sub AddRoleButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dv As DetailsView = EditorDetailsView
        Dim pop As ASPxPopupControl = dv.FindControl("ASPxPopupControl1")
        Dim gv As ASPxGridView = pop.FindControl("RoleGridview")
        Dim obj As MyGroup = GetBusinessObject()
        For i As Integer = 0 To gv.Selection.Count - 1
            If gv.Selection.Count > 1 Then
                Dim roleId As String = gv.GetRowValues(i, "RoleId").ToString.Trim
                obj.Roles.Assign(roleId, True)
            Else
                Dim roleId As String = gv.GetRowValues(gv.FocusedRowIndex(), "RoleId").ToString.Trim
                obj.Roles.Assign(roleId, True)
            End If
        Next
        obj.Save()
        Dim gv2 As ASPxGridView = dv.FindControl("DetailGridView")
        gv2.DataBind()
    End Sub

    Protected Sub AddMemberButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dv As DetailsView = EditorDetailsView
        Dim pop As ASPxPopupControl = dv.FindControl("ASPxPopupControl2")
        Dim gv As ASPxGridView = pop.FindControl("MemberGridview")
        Dim obj As MyGroup = GetBusinessObject()
        For i As Integer = 0 To gv.Selection.Count - 1
            If gv.Selection.Count > 1 Then
                Dim usrId As String = gv.GetRowValues(i, "UserId").ToString.Trim
                obj.Members.Assign(usrId, True)
            Else
                Dim usrId As String = gv.GetRowValues(gv.FocusedRowIndex(), "UserId").ToString.Trim
                obj.Members.Assign(usrId, True)
            End If
        Next
        obj.Save()

        Dim gv2 As ASPxGridView = dv.FindControl("MemberSelectionGridView")
        gv2.DataBind()
    End Sub

#End Region

#Region " Detail View "

    Protected Sub EditorDetailsView_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles EditorDetailsView.ItemDeleting

    End Sub

    Protected Sub EditorDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles EditorDetailsView.ItemInserting
        Dim dv As DetailsView = sender
        Dim obj As MyGroup = GetBusinessObject()
        If Not obj Is Nothing Then
            Csla.Data.Map(e.Values, obj)
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

#End Region

End Class
