#Region " Header "
Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
#End Region

Partial Class Utility_Izin_HO_HOBAP
    Inherits System.Web.UI.Page
    Private session1 As Session

#Region " Xpo "
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        HOXpoDataSource.Session = session1
        TimTeknisXpoDataSource.Session = session1
        BAPDetailXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
#End Region

#Region " Session "
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("HOID") = Nothing
        End If
    End Sub
#End Region

#Region " Cari "
    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim obj As Permohonan = session1.FindObject(Of Permohonan)(New BinaryOperator("NomorPermohonan", NoPermohonanASPxTextBox.Text.Trim))
        If PD(obj) Then
            HODetailsView.Visible = True
            HODetailsView.ChangeMode(DetailsViewMode.Edit)
        Else
            HODetailsView.Visible = False
        End If
    End Sub

    Private Function PD(ByVal obj As Permohonan) As Boolean
        Dim izin As JenisIzin = session1.FindObject(Of JenisIzin)(New BinaryOperator("JenisIzinNama", "HO"))
        Dim PDetail As PermohonanDetail = session1.FindObject(Of PermohonanDetail)(CriteriaOperator.Parse("PermohonanID='" & obj.PermohonanID.ToString & _
                                            "' And JenisIzinID.JenisIzinNama='HO'"))
        If PDetail IsNot Nothing Then
            Dim objHO As HO = session1.FindObject(Of HO)(New BinaryOperator("HOID", PDetail.PermohonanIzinID))
            If cekBAP(objHO) Then
                Session("HOID") = objHO.HOID
                Return True
            Else
                Session("HOID") = Nothing
            End If
        Else
            Session("HOID") = Nothing
            Return False
        End If
    End Function

    Private Function cekBAP(ByVal obj As HO) As Boolean
        Dim bap As HOBAP = session1.FindObject(Of HOBAP)(New BinaryOperator("HOID", obj.HOID))
        If bap IsNot Nothing Then
            Session("BAPID") = bap.HOBAPID
            Return True
        Else
            If obj IsNot Nothing Then
                buatBAP(obj)
                Return True
            Else
                Session("BAPID") = Nothing
                Return False
            End If
        End If
    End Function

    Private Function buatBAP(ByVal obj As HO) As Boolean
        Dim bap As New HOBAP(session1)
        bap.HOBAPID = Guid.NewGuid
        bap.HOID = obj
        bap.Save()
        Session("BAPID") = bap.HOBAPID
    End Function
#End Region

#Region " Detail View "

    Protected Sub HODetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles HODetailsView.DataBound
        If HODetailsView.CurrentMode = DetailsViewMode.Edit Then
            Dim obj As HO = session1.FindObject(Of HO)(New BinaryOperator("HOID", Session("HOID")))
            Dim objBap As HOBAP = session1.FindObject(Of HOBAP)(New BinaryOperator("HOBAPID", Session("BAPID")))
            Dim dv As DetailsView = HODetailsView
            Dim kesimpulan As ASPxMemo = DirectCast(dv.FindControl("KesimpulanASPxMemo"), ASPxMemo)
            Dim JenisUsahaASPxLabel As ASPxLabel = DirectCast(dv.FindControl("JenisUsahaASPxLabel"), ASPxLabel)
            JenisUsahaASPxLabel.Text = obj.JenisUsahaID.JenisUsaha
            kesimpulan.Text = objBap.Kesimpulan
        End If
    End Sub

    Protected Sub HODetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles HODetailsView.ItemUpdated
        HODetailsView.Visible = False
        PopupPeringatan.ShowOnPageLoad = True
    End Sub

    Protected Sub HODetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles HODetailsView.ItemUpdating
        Dim bacatgl As New TglTerbilang
        Dim obj As HOBAP = session1.FindObject(Of HOBAP)(New BinaryOperator("HOBAPID", Session("BAPID")))
        Dim objHO As HO = session1.FindObject(Of HO)(New BinaryOperator("HOID", Session("HOID")))
        Dim kesimpulan As ASPxMemo = DirectCast(HODetailsView.FindControl("KesimpulanASPxMemo"), ASPxMemo)
        Dim tglterbilang As ASPxDateEdit = DirectCast(HODetailsView.FindControl("TglASPxDateEdit"), ASPxDateEdit)
        Dim thn As String = Right(bacatgl.Tanggal(tglterbilang.Date), 4)
        Dim poh As New Baca
        thn = poh.Terbilang(thn)
        Dim hli As String = bacatgl.Tanggal(tglterbilang.Date).Replace("2010", "")
        hli = hli & thn
        objHO.TglTerbilang = hli
        obj.Kesimpulan = kesimpulan.Text.Trim
        obj.Save()
    End Sub

#End Region

#Region " GridView "
    Protected Sub BAP_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        Dim obj As HOBAP = session1.FindObject(Of HOBAP)(New BinaryOperator("HOBAPID", Session("BAPID")))
        e.NewValues("HOBAPID!Key") = obj.HOBAPID
    End Sub
#End Region

End Class
