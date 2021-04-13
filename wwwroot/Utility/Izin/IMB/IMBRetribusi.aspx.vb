Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Data.Filtering

Partial Class Utility_Izin_IMBRetribusi
    Inherits System.Web.UI.Page

    Dim session1 As Session = Nothing

    Private retribusi As IMBRetribusi
    Private totRetribusi As Decimal = 0
    Private retid As Guid = Guid.Empty

#Region " Handler "

    Protected Sub NewBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NewBtn.Click
        Me.MultiView.ActiveViewIndex = 1
        Me.RetribusiDetailsView.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub EditBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditBtn.Click
        retid = RetribusiListGridView.GetRowValues(RetribusiListGridView.FocusedRowIndex, "Row_id")
        Session("Row_id") = retid
        Me.MultiView.ActiveViewIndex = 1
        Session("Row_id") = retid
        RetribusiDetailsView.DataBind()
    End Sub

    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim izin As New XPCollection(Of JenisIzin)(session1)
        Dim tb As ASPxTextBox = DirectCast(RetribusiDetailsView.FindControl("searchNomerPermohonanASPxTextBox"), ASPxTextBox)
        Dim lb As ASPxLabel = DirectCast(RetribusiDetailsView.FindControl("MessageLabel"), ASPxLabel)
        Dim noPermohonan As String = tb.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If Not objPermohonan Is Nothing Then
            For Each detail As PermohonanDetail In objPermohonan.PermohonanDetail
                For Each item As JenisIzin In izin
                    If item.JenisIzinID = detail.JenisIzinID.JenisIzinID Then
                        If item.JenisIzinNama = "IMB" Then
                            'Cek apakah sudah pernah dibuatkan retribusi
                            Dim retList As New XPCollection(Of IMBRetribusi)(session1)
                            For Each ret As IMBRetribusi In retList
                                If ret.imbid.IMBID = Session("imbid") Then
                                    'lb.Text = "Permohonan sudah dibuatkan retribusi"
                                    'Exit For
                                Else
                                    lb.Text = "Permohonan " & item.JenisIzinNama & " ditemukan"
                                    Session("imbid") = detail.PermohonanIzinID
                                End If
                            Next
                        End If
                    End If
                Next
                Dim obj As IMB = session1.GetObjectByKey(Of IMB)(detail.PermohonanIzinID)
                lb.Text = "Permohonan  ditemukan"
                Session("kodeimb") = detail.PermohonanIzinID
                Exit For
            Next
        Else
            lb.Text = "Permohonan tidak ditemukan"
        End If
    End Sub

#End Region

#Region " Details View "

    Protected Sub RetribusiDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RetribusiDetailsView.DataBound
        Dim dv As DetailsView = DirectCast(sender, DetailsView)
        Dim lbl As ASPxLabel = DirectCast(dv.FindControl("PermohonanLabel"), ASPxLabel)
        Dim obj As IMBRetribusi = session1.GetObjectByKey(Of IMBRetribusi)(RetribusiDetailsView.DataKey.Value)
        Dim rek As Rekening = session1.GetObjectByKey(Of Rekening)(Session("rek_id"))
        Dim reklbl As ASPxLabel = DirectCast(dv.FindControl("RekeningLabel"), ASPxLabel)
        Session("Row_id") = RetribusiDetailsView.DataKey.Value
        If Not lbl Is Nothing Then
            If Not obj Is Nothing Then
                lbl.Text = obj.imbid.permohonanID.NomorPermohonan
            End If
        End If
        'If Not reklbl Is Nothing Then
        '    If Not rek Is Nothing Then
        '        reklbl.Text = rek.rekening
        '    Else
        '        reklbl.Text = "Rekening Belum ditentukan"
        '    End If
        'End If
    End Sub

    Protected Sub RetribusiDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles RetribusiDetailsView.ItemInserting
        Dim dv As DetailsView = DirectCast(sender, DetailsView)
        Dim tgl As ASPxDateEdit = DirectCast(dv.FindControl("PembayaranDate"), ASPxDateEdit)

        Dim cmbRekening As ASPxComboBox = DirectCast(dv.FindControl("RekeningComboBox"), ASPxComboBox)
        Dim cmbDaerah As ASPxComboBox = DirectCast(dv.FindControl("DaerahComboBox"), ASPxComboBox)
        Dim cmbKelasJalan As ASPxComboBox = DirectCast(dv.FindControl("KelasJalanComboBox"), ASPxComboBox)
        Dim cmbGunaBangunan As ASPxComboBox = DirectCast(dv.FindControl("GunaBangunanComboBox"), ASPxComboBox)
        Dim cmbKelasBangunan As ASPxComboBox = DirectCast(dv.FindControl("KelasBangunanComboBox"), ASPxComboBox)
        Dim cmbStatusBangunan As ASPxComboBox = DirectCast(dv.FindControl("StatusBangunanComboBox"), ASPxComboBox)
        Dim cmbTingkatBangunan As ASPxComboBox = DirectCast(dv.FindControl("TingkatBangunanComboBox"), ASPxComboBox)
        Dim cmbLuasBangunan As ASPxComboBox = DirectCast(dv.FindControl("LuasBangunanComboBox"), ASPxComboBox)

        If Not Session("imbid") Is Nothing Then
            e.Values.Item("imbid") = session1.GetObjectByKey(Of IMB)(Session("imbid"))

            e.Values.Item("Daerah") = cmbDaerah.Value
            e.Values.Item("KelasJalan") = cmbKelasJalan.Value
            e.Values.Item("GunaBangunan") = cmbGunaBangunan.Value
            e.Values.Item("KelasBangunan") = cmbKelasBangunan.Value
            e.Values.Item("StatusBangunan") = cmbStatusBangunan.Value
            e.Values.Item("TingkatBangunan") = cmbTingkatBangunan.Value
            e.Values.Item("LuasBangunan") = cmbLuasBangunan.Value

            e.Values.Item("Retribusi") = retribusi

            
        Else
            e.Cancel = True
        End If
    End Sub

    Protected Sub RetribusiDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles RetribusiDetailsView.ItemUpdating
        Dim dv As DetailsView = DirectCast(sender, DetailsView)
        Dim cmbRekening As ASPxComboBox = DirectCast(dv.FindControl("RekeningComboBox"), ASPxComboBox)
        e.NewValues.Item("rek_id") = cmbRekening.Text
    End Sub

    Protected Sub PenjualanDetailsView_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewCommandEventArgs) Handles RetribusiDetailsView.ItemCommand
        Dim dv As DetailsView = DirectCast(sender, DetailsView)
        Select Case e.CommandName.ToLower.Trim
            Case "back"
                Me.MultiView.ActiveViewIndex = 0
                RetribusiListGridView.DataBind()
            Case "edit"
                Me.MultiView.ActiveViewIndex = 1
                dv.ChangeMode(DetailsViewMode.Edit)
        End Select
    End Sub

#End Region

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        RekeningDataSource.Session = session1
        RetribusiListDataSource.Session = session1
        RetribusiDataSource.Session = session1
        PermohonanDataSource.Session = session1
        RetribusiDetailsDataSource.Session = session1
        HDUmumDataSource.Session = session1
        HDLainDataSource.Session = session1
        KoefDaerahDataSource.Session = session1
        KelasJalanDataSource.Session = session1
        KelasBangunanDataSource.Session = session1
        StatusBangunanDataSource.Session = session1
        GunaBangunanDataSource.Session = session1
        TingkatBangunanDataSource.Session = session1
        LuasBangunanDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub RetribusiDetailsGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("RetribusiId!Key") = Session("Row_id")
        totRetribusi = totRetribusi + (e.NewValues.Item("HDUmum") * e.NewValues.Item("HDUmumJML"))
        totRetribusi = totRetribusi + (e.NewValues.Item("HDLain") * e.NewValues.Item("HDLainJML"))
        'Update Total Retribusi IMB
        Dim ret As IMBRetribusi = session1.GetObjectByKey(Of IMBRetribusi)(Session("Row_id"))
        Dim koef As Decimal = 0
        koef = (ret.Daerah + ret.KelasJalan + ret.GunaBangunan + ret.KelasBangunan + ret.StatusBangunan + ret.TingkatBangunan + ret.LuasBangunan) / 7
        ret.Retribusi = ret.Retribusi + (totRetribusi * koef) / 100
        ret.Retribusi = Decimal.Round(ret.Retribusi, 0) + ret.Leges + ret.PapanNama
        ret.Terbilang = Terbilang(ret.Retribusi.ToString)
        ret.Save()
    End Sub

    Protected Sub RetribusiDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles RetribusiDetailsView.ItemInserted
        'Me.MultiView.ActiveViewIndex = 0
        'RetribusiListGridView.DataBind()
        Dim id As Guid = New Guid(CStr(Session("imbmekso")))
        Session("Row_id") = id
        MultiView.ActiveViewIndex = 1
        RetribusiDetailsView.ChangeMode(DetailsViewMode.ReadOnly)
        RetribusiDetailsView.DataBind()
    End Sub

    Public Function Terbilang(ByVal strAngka As String) As String
        Dim strJmlHuruf, intPecahan As Integer, strPecahan$, Urai$, Bil1$, strTot$, Bil2$
        Dim X, y, z As Integer
        If strAngka = "" Then Exit Function
        strJmlHuruf = LTrim(strAngka)
        intPecahan = Val(Right(Mid(strAngka, 15, 2), 2))
        If (intPecahan = 0) Then
            strPecahan = ""
        Else
            strPecahan = LTrim(Str(intPecahan)) + "/100 "
        End If

        X = 0
        y = 0
        Urai = ""

        While (X < strJmlHuruf.ToString.Length)
            X = X + 1
            strTot = Mid(strJmlHuruf, X, 1)
            y = y + Val(strTot)
            z = strJmlHuruf.ToString.Length - X + 1
            Select Case Val(strTot)
                Case 1
                    If (z = 1 Or z = 7 Or z = 10 Or z = 13) Then
                        Bil1 = "Satu "
                    ElseIf (z = 4) Then
                        If (X = 1) Then
                            Bil1 = "Se"
                        Else
                            Bil1 = "SATU "
                        End If
                    ElseIf (z = 2 Or z = 5 Or z = 8 Or z = 11 Or z = 14) Then
                        X = X + 1
                        strTot = Mid(strJmlHuruf, X, 1)
                        z = strJmlHuruf.ToString.Length - X + 1
                        Bil2 = ""
                        Select Case Val(strTot)
                            Case 0
                                Bil1 = "Sepuluh "
                            Case 1
                                Bil1 = "Sebelas "
                            Case 2
                                Bil1 = "Dua belas "
                            Case 3
                                Bil1 = "Tiga belas "
                            Case 4
                                Bil1 = "Empat belas "
                            Case 5
                                Bil1 = "Lima belas "
                            Case 6
                                Bil1 = "Enam belas "
                            Case 7
                                Bil1 = "Tujuh belas "
                            Case 8
                                Bil1 = "Delapan belas "
                            Case 9
                                Bil1 = "Sembilan belas "
                        End Select
                    Else
                        Bil1 = "Se"
                    End If
                Case 2
                    Bil1 = "Dua "
                Case 3
                    Bil1 = "Tiga "
                Case 4
                    Bil1 = "Empat "
                Case 5
                    Bil1 = "Lima "
                Case 6
                    Bil1 = "Enam "
                Case 7
                    Bil1 = "Tujuh "
                Case 8
                    Bil1 = "Delapan "
                Case 9
                    Bil1 = "Sembilan "
                Case Else
                    Bil1 = ""
            End Select

            If (Val(strTot) > 0) Then
                If (z = 2 Or z = 5 Or z = 8 Or z = 11 Or z = 14) Then
                    Bil2 = "Puluh "
                ElseIf (z = 3 Or z = 6 Or z = 9 Or z = 12 Or z = 15) Then
                    Bil2 = "Ratus "
                Else
                    Bil2 = ""
                End If
            Else
                Bil2 = ""
            End If
            If (y > 0) Then
                Select Case z
                    Case 4
                        Bil2 = Bil2 + "Ribu "
                        y = 0
                    Case 7
                        Bil2 = Bil2 + "Juta "
                        y = 0
                    Case 10
                        Bil2 = Bil2 + "Milyar "
                        y = 0
                    Case 13
                        Bil2 = Bil2 + "Trilyun "
                        y = 0
                End Select
            End If

            Urai = Urai + Bil1 + Bil2
        End While
        Urai = Urai + strPecahan
        Terbilang = Urai
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("Row_ID") = Nothing
        End If
    End Sub

    Protected Sub RetribusiDataSource_Inserted(ByVal sender As Object, ByVal e As DevExpress.Xpo.XpoDataSourceInsertedEventArgs) Handles RetribusiDataSource.Inserted
        Dim obj As IMBRetribusi = DirectCast(e.Value, IMBRetribusi)
        Session("imbmekso") = obj.Row_id.ToString
    End Sub

End Class