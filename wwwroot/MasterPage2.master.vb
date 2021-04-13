Option Explicit On
Option Strict On
Imports System.Web.HttpApplication
Imports Bisnisobjek
Imports Bisnisobjek.OSS
Imports ASP.global_asax
Imports AssemblyInfo
Imports System.Drawing.Color
Imports ASP.masterpage2_master
Imports DevExpress.Web.ASPxNavBar

Partial Class MasterPage2
    Inherits System.Web.UI.MasterPage

    Private Function CurrentUserName() As String
        Dim user As String = "[USER]"
        If HttpContext.Current.User.Identity.IsAuthenticated Then
            user = HttpContext.Current.User.Identity.Name
        End If
        Return user
    End Function

    Protected Sub LogoutButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LogoutButton.Click
        LoginUtility.Logout()
        Session.Abandon()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CurrentUserLink.Text = HttpContext.Current.User.Identity.Name
        lblTanggal.Text = "[" & Format(Now(), "dddd, dd MMMM yyyy") & "]"
    End Sub

    Private Sub SetPanel()
        Dim nav As ASPxNavBar = ASPxNavBar1
        For i As Integer = 0 To nav.Items.Count - 1
            nav.Items(i).Visible = False
        Next

        Dim role As String = ""
        If Not Session("user") Is Nothing Then
            If Session("user").ToString = "root" Then
                For i As Integer = 0 To nav.Items.Count - 1
                    nav.Items(i).Visible = False
                Next
            End If
        Else
            Dim user As MyUserInfo = MyUserInfo.GetInfo(HttpContext.Current.User.Identity.Name)
            If Not user Is Nothing Then
                For Each item As MyGroupRole In user.Roles
                    role = item.RoleId.Trim
                    If role = "BAYARRETRIBUSI" Then
                        nav.Items(5).Visible = True
                    ElseIf role = "DATAIZIN" Then
                        nav.Items(1).Visible = True
                    ElseIf role = "LAPORAN" Then
                        nav.Items(7).Visible = True
                    ElseIf role = "MAINTENANCE" Then
                        nav.Items(9).Visible = True
                    ElseIf role = "PEMERIKSAAN" Then
                        nav.Items(2).Visible = True
                    ElseIf role = "PERMOHONAN" Then
                        nav.Items(0).Visible = True
                    ElseIf role = "RAPAT" Then
                        nav.Items(3).Visible = True
                    ElseIf role = "RETRIBUSI" Then
                        nav.Items(4).Visible = True
                    ElseIf role = "SERAHTERIMA" Then
                        nav.Items(8).Visible = True
                    ElseIf role = "UPDATESTATUS" Then
                        nav.Items(6).Visible = True
                    ElseIf role = "USERMANAGER" Then
                        nav.Items(10).Visible = True
                    End If
                Next
            End If
        End If

    End Sub

End Class

