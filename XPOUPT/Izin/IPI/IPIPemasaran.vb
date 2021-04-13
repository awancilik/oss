Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPIPemasaran
		Inherits XPLiteObject
		Dim fIPIPemasaranID As Guid
		<Key(true)> _
		Public Property IPIPemasaranID() As Guid
			Get
				Return fIPIPemasaranID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPIPemasaranID", fIPIPemasaranID, value)
			End Set
		End Property
        Dim fIPIID As IPI
        Public Property IPIID() As IPI
            Get
                Return fIPIID
            End Get
            Set(ByVal value As IPI)
                SetPropertyValue(Of IPI)("IPIID", fIPIID, value)
            End Set
        End Property
		Dim fPemasaranDlmLuarNegri As String
		<Size(15)> _
		Public Property PemasaranDlmLuarNegri() As String
			Get
				Return fPemasaranDlmLuarNegri
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemasaranDlmLuarNegri", fPemasaranDlmLuarNegri, value)
			End Set
		End Property
		Dim fVolume As Double
		Public Property Volume() As Double
			Get
				Return fVolume
			End Get
			Set(ByVal value As Double)
				SetPropertyValue(Of Double)("Volume", fVolume, value)
			End Set
		End Property
		Dim fNilai As Decimal
		Public Property Nilai() As Decimal
			Get
				Return fNilai
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Nilai", fNilai, value)
			End Set
		End Property
		Public Sub New(ByVal session As Session)
			MyBase.New(session)
		End Sub
		Public Sub New()
			MyBase.New(Session.DefaultSession)
		End Sub
		Public Overrides Sub AfterConstruction()
			MyBase.AfterConstruction()
		End Sub
	End Class

End Namespace
