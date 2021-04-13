Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Xpo.DB
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
Partial Class Utility_Izin_TDI_TDI
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        TDIXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
        KLUIXpoDataSource.Session = session1
        TDIIDetailXpoDataSource.Session = session1
        MesinXpoDataSource.Session = session1
        TDIKomoditiXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Cek Permohonan - PD - Cek TDI "

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        If NoPermohonanASPxTextBox.Text.Trim IsNot Nothing Then
            If CekPermohonan(NoPermohonanASPxTextBox.Text.Trim) = True Then
                TDIDetailView.Visible = True
                TDIDetailView.ChangeMode(DetailsViewMode.Edit)
            Else
                TDIDetailView.Visible = False
                TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
            End If
        End If
    End Sub

    Private Function CekPermohonan(ByVal noPermohonan As String) As Boolean
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query1), Permohonan)
        If objPermohonan IsNot Nothing Then
            If CekPD(objPermohonan.PermohonanID.ToString) = True Then
                Return True
            End If
        Else
            Return False
        End If
    End Function

    Private Function CekPD(ByVal permohonanid As String) As Boolean
        Dim queryCrit As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='TDI'")
        Dim izinid As JenisIzin = DirectCast(session1.FindObject(GetType(JenisIzin), queryCrit), JenisIzin)
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & "' And JenisIzinID='" & izinid.JenisIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        If objPD IsNot Nothing Then
            If CekTDI(objPD.PermohonanIzinID.ToString) = True Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function CekTDI(ByVal TDIID As String) As Boolean
        Dim objIPI As TDI = session1.FindObject(Of TDI)(New BinaryOperator("TDIID", TDIID))
        If objIPI IsNot Nothing Then
            Session("TDIID") = objIPI.TDIID
            Return True
        Else
            Session("TDIID") = Nothing
            Return False
        End If
    End Function

#End Region

#Region " Combo Box "

    Protected Sub KelurahanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles KelurahanASPxCallback.Callback
        Session("KelurahanID") = e.Parameter
    End Sub

    Protected Sub KelurahanASPxComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KecamatanID") = e.Parameter
        Dim dv As DetailsView = TDIDetailView
        Dim cbKelurahan As ASPxComboBox = DirectCast(dv.FindControl("KelurahanASPxComboBox"), ASPxComboBox)
        If cbKelurahan IsNot Nothing Then
            cbKelurahan.DataBind()
        End If
    End Sub

#End Region

#Region " DetailView "

    Protected Sub TDIDetailView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles TDIDetailView.DataBound
        Dim dv As DetailsView = TDIDetailView
        Dim cbKelurahan As ASPxComboBox = DirectCast(dv.FindControl("KelurahanASPxComboBox"), ASPxComboBox)
        Dim cbKecamatan As ASPxComboBox = DirectCast(dv.FindControl("KecamatanASPxComboBox"), ASPxComboBox)
        Dim investasi As ASPxTextBox = DirectCast(dv.FindControl("InvestasiASPxTextBox"), ASPxTextBox)
        Dim TDIID As CriteriaOperator = CriteriaOperator.Parse("TDIID='" & Session("TDIID").ToString & "'")
        Dim objTDI As TDI = DirectCast(session1.FindObject(GetType(TDI), TDIID), TDI)
        If dv.CurrentMode = DetailsViewMode.Edit Then
            If objTDI.Investasi > 0 Then
                Dim str As Integer = CInt(objTDI.Investasi)
                investasi.Text = CStr(str)
            End If
            If cbKelurahan IsNot Nothing Then
                If objTDI.PabrikKelurahanID IsNot Nothing Then
                    cbKelurahan.Value = objTDI.PabrikKelurahanID.KelurahanID.ToString
                    Session("KelurahanID") = objTDI.PabrikKelurahanID.KelurahanID.ToString
                    cbKelurahan.Text = objTDI.PabrikKelurahanID.KelurahanNama

                End If
            End If
            If cbKecamatan IsNot Nothing Then
                If objTDI.PabrikKelurahanID IsNot Nothing Then
                    cbKecamatan.Value = objTDI.PabrikKelurahanID.KelurahanKecamatanID.KecamatanID
                    Session("KecamatanID") = objTDI.PabrikKelurahanID.KelurahanKecamatanID.KecamatanID
                    cbKecamatan.Text = objTDI.PabrikKelurahanID.KelurahanKecamatanID.KecamatanNama
                End If
            End If
        End If
    End Sub

    Protected Sub TDIDetailView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles TDIDetailView.ItemUpdated
        TDIDetailView.Visible = False
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub TDIDetailView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles TDIDetailView.ItemUpdating
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("TDIID='" & Session("TDIID").ToString & "'")
        Dim objTDI As TDI = DirectCast(session1.FindObject(GetType(TDI), query1), TDI)
        Dim dv As DetailsView = TDIDetailView
        Dim cbKelurahan As ASPxComboBox = DirectCast(dv.FindControl("KelurahanASPxComboBox"), ASPxComboBox)
        Dim tbInvestas As ASPxTextBox = DirectCast(dv.FindControl("InvestasiASPxTextBox"), ASPxTextBox)
        If CInt(tbInvestas.Text) > 0 And tbInvestas.Text IsNot Nothing Then
            Dim Terbilang As New Baca
            objTDI.InvestasiTerbilang = Terbilang.Terbilang(tbInvestas.Text)
        End If
        If Session("KelurahanID") IsNot Nothing Then
            Dim query2 As CriteriaOperator = CriteriaOperator.Parse("KelurahanID='" & Session("KelurahanID").ToString & "'")
            objTDI.PabrikKelurahanID = DirectCast(session1.FindObject(GetType(Kelurahan), query2), Kelurahan)
        Else
            Dim query2 As CriteriaOperator = CriteriaOperator.Parse("KelurahanID='" & cbKelurahan.Value.ToString & "'")
            objTDI.PabrikKelurahanID = DirectCast(session1.FindObject(GetType(Kelurahan), query2), Kelurahan)
        End If
        Dim nonipik As String = CStr(e.NewValues.Item("NIPIK"))
        objTDI.NIPIK = Right(nonipik, 5)
        objTDI.Komoditi = Komoditi()
        objTDI.Save()
    End Sub

    Private Function Komoditi() As String
        Dim oTDI As TDI = session1.FindObject(Of TDI)(New BinaryOperator("TDIID", Session("TDIID")))
        If oTDI IsNot Nothing Then
            Dim sKomoditi As String = ""
            Dim koleksi As New XPCollection(Of TDIKomoditi)(session1, New BinaryOperator("TDIID", Session("TDIID")))
            For x As Integer = 0 To koleksi.Count - 1
                Dim ahkir As Integer = koleksi.Count - 1
                If String.IsNullOrEmpty(Komoditi) Then
                    Komoditi = Komoditi + " " & koleksi.Object(x).Komoditi.ToString
                ElseIf x = ahkir Then
                    Komoditi = Komoditi + " dan " & koleksi.Object(x).Komoditi
                Else
                    Komoditi = Komoditi + ", " & koleksi.Object(x).Komoditi.ToString
                End If
            Next
            Return Komoditi
        End If
    End Function
#End Region

#Region " GridView "

    Protected Sub KLUIASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("TDIID!Key") = Session("TDIID")
    End Sub

    Protected Sub MesinASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("TDIID!Key") = Session("TDIID")
    End Sub

    Protected Sub KomoditasASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("TDIID!Key") = Session("TDIID")
    End Sub


#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("KecamatanID") = Nothing
            Session("KelurahanID") = Nothing
            Session("TDIID") = Nothing
        End If
    End Sub


End Class
