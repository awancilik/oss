Imports Microsoft.VisualBasic
Imports DevExpress.Data.Filtering
Imports DevExpress.Xpo
Public Class TglTerbilang

    Public Function Tanggal(ByVal tgl As Date) As String
        Dim strJmlHuruf, intPecahan As Double, strPecahan$, Urai$, Bil1$, strTot$, Bil2$
        Dim X, y, z As Integer
        If tgl = Nothing Then Exit Function
        Dim tanggalan As Integer = tgl.Day
        Dim bulanan As Integer = tgl.Month
        strJmlHuruf = CDbl(LTrim(tanggalan))
        intPecahan = CInt(Val(Right(Mid(tanggalan, 15, 2), 2)))

        X = 0
        y = 0
        Urai = ""

        While (X < strJmlHuruf.ToString.Length)
            X = X + 1
            strTot = Mid(CStr(strJmlHuruf), X, 1)
            y = CInt(y + Val(strTot))
            z = strJmlHuruf.ToString.Length - X + 1
            Select Case Val(strTot)
                Case 1
                    If (z = 1 Or z = 7 Or z = 10 Or z = 13) Then
                        Bil1 = "satu "
                    ElseIf (z = 4) Then
                        If (X = 1) Then
                            Bil1 = "se"
                        Else
                            Bil1 = "satu "
                        End If
                    ElseIf (z = 2 Or z = 5 Or z = 8 Or z = 11 Or z = 14) Then
                        X = X + 1
                        strTot = Mid(CStr(strJmlHuruf), X, 1)
                        z = strJmlHuruf.ToString.Length - X + 1
                        Bil2 = ""
                        Select Case Val(strTot)
                            Case 0
                                Bil1 = "sepuluh "
                            Case 1
                                Bil1 = "sebelas "
                            Case 2
                                Bil1 = "dua belas "
                            Case 3
                                Bil1 = "tiga belas "
                            Case 4
                                Bil1 = "empat belas "
                            Case 5
                                Bil1 = "lima belas "
                            Case 6
                                Bil1 = "enam belas "
                            Case 7
                                Bil1 = "tujuh belas "
                            Case 8
                                Bil1 = "delapan belas "
                            Case 9
                                Bil1 = "sembilan belas "
                        End Select
                    Else
                        Bil1 = "se"
                    End If
                Case 2
                    Bil1 = "dua "
                Case 3
                    Bil1 = "tiga "
                Case 4
                    Bil1 = "empat "
                Case 5
                    Bil1 = "lima "
                Case 6
                    Bil1 = "enam "
                Case 7
                    Bil1 = "tujuh "
                Case 8
                    Bil1 = "delapan "
                Case 9
                    Bil1 = "sembilan "
                Case Else
                    Bil1 = ""
            End Select

            If (Val(strTot) > 0) Then
                If (z = 2 Or z = 5 Or z = 8 Or z = 11 Or z = 14) Then
                    Bil2 = "puluh "
                Else
                    Bil2 = ""
                End If
            Else
                Bil2 = ""
            End If


            Urai = Urai + Bil1 + Bil2
        End While
        Dim bulan As String
        Select Case (tgl.Month)
            Case 1
                bulan = "Januari"
            Case 2
                bulan = "Febuari"
            Case 3
                bulan = "Maret"
            Case 4
                bulan = "April"
            Case 5
                bulan = "Mei"
            Case 6
                bulan = "Juni"
            Case 7
                bulan = "Juli"
            Case 8
                bulan = "Agustus"
            Case 9
                bulan = "September"
            Case 10
                bulan = "Oktober"
            Case 11
                bulan = "November"
            Case 12
                bulan = "Desember"
        End Select
        Urai = Urai + "bulan " + bulan + " tahun " + tgl.Year.ToString
        Tanggal = Urai
    End Function
End Class
