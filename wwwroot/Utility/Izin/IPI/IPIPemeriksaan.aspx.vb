Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxEditors

Partial Class Utility_Izin_IPI_IPIPemeriksaan
    Inherits System.Web.UI.Page
    Private session1 As Session

#Region " Xpo "
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        permohonanXpoDataSource.Session = session1
        IPIPemeriksaanXpoDataSource.Session = session1
        IPIPemeriksaanDetailXpoDataSource.Session = session1
        timPemeriksaXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
#End Region

#Region " Cek Nomopermohonan - IPI - IPIPemeriksaan "

    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objPermohonan IsNot Nothing Then
            Session("PermohonanID") = objPermohonan.PermohonanID
            CheckIPI(objPermohonan)
            If CheckPemeriksaan() Then
                bikinASPxButton.Visible = False
            Else
                bikinASPxButton.Visible = True
            End If
            permohonanDetailsView.DataBind()
        Else
            Session("PermohonanID") = Nothing
            Session("IPIID") = Nothing
            notFoundASPxPopupControl.ShowOnPageLoad = True
            permohonanDetailsView.DataBind()
        End If
    End Sub

    Private Sub CheckIPI(ByVal obj As Permohonan)
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID.PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objIPI As IPI = DirectCast(session1.FindObject(GetType(IPI), criteria), IPI)
        If objIPI IsNot Nothing Then
            Session("objIPI") = objIPI
            Session("IPIID") = objIPI.IPIID
        Else
            Session("IPIID") = Nothing
        End If
    End Sub

    Private Function CheckPemeriksaan() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objPemeriksaan As IPIPemeriksaan = DirectCast(session1.FindObject(GetType(IPIPemeriksaan), criteria), IPIPemeriksaan)
        If objPemeriksaan IsNot Nothing Then
            Session("IPIPemeriksaanID") = objPemeriksaan.IPIPemeriksaanID
            Return True
        Else
            Session("IPIPemeriksaanID") = Nothing

            Return False
        End If
    End Function

#End Region

#Region " Detail View "

    Protected Sub bikinASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bikinASPxButton.Click
        IPIPemeriksaanDetailsView.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub IPIPemeriksaanDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles IPIPemeriksaanDetailsView.ItemInserted
        If CheckPemeriksaan() Then
            bikinASPxButton.Visible = False
        Else
            bikinASPxButton.Visible = True
        End If
    End Sub

    Protected Sub IPIPemeriksaanDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles IPIPemeriksaanDetailsView.ItemInserting
        Dim permohonanid As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & Session("PermohonanID").ToString & "'")
        e.Values.Item("PermohonanID") = DirectCast(session1.FindObject(GetType(Permohonan), permohonanid), Permohonan)
        Dim IPIID As CriteriaOperator = CriteriaOperator.Parse("IPIID='" & Session("IPIID").ToString & "'")
        e.Values.Item("IPIID") = DirectCast(session1.FindObject(GetType(IPI), IPIID), IPI)
        TanggalTerbilang()
    End Sub

    Protected Sub IPIPemeriksaanDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles IPIPemeriksaanDetailsView.ItemUpdating
        TanggalTerbilang()
    End Sub

    Private Sub TanggalTerbilang()
        Dim dv As DetailsView = IPIPemeriksaanDetailsView
        Dim tgl As ASPxDateEdit = DirectCast(dv.FindControl("tanggalPemeriksaanASPxDateEdit"), ASPxDateEdit)
        If tgl IsNot Nothing Then
            Dim tanggal As Date = tgl.Date
            Dim panggil As New TglTerbilang
            Dim query As CriteriaOperator = CriteriaOperator.Parse("IPIID='" & Session("IPIID").ToString & "'")
            Dim objIPIPemeriksaan As IPIPemeriksaan = DirectCast(session1.FindObject(GetType(IPIPemeriksaan), query), IPIPemeriksaan)
            If objIPIPemeriksaan IsNot Nothing Then
                objIPIPemeriksaan.TanggalTerbilang = panggil.Tanggal(tanggal)
                objIPIPemeriksaan.Save()
            End If
        End If
    End Sub

#End Region

#Region " Grid View "

    Protected Sub IPIPemeriksaanDetailASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IPIPemeriksaanID!Key") = Session("IPIPemeriksaanID")
    End Sub

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("IPIID") = Nothing
            Session("IPIPemeriksaanID") = Nothing
        End If
    End Sub


End Class
