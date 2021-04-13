Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IUIKomoditi
		Inherits XPLiteObject
		Dim fIUIKomoditiID As Guid
		<Key(true)> _
		Public Property IUIKomoditiID() As Guid
			Get
				Return fIUIKomoditiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIKomoditiID", fIUIKomoditiID, value)
			End Set
		End Property
        Dim fIUIID As IUI
        Public Property IUIID() As IUI
            Get
                Return fIUIID
            End Get
            Set(ByVal value As IUI)
                SetPropertyValue(Of IUI)("IUIID", fIUIID, value)
            End Set
        End Property
		Dim fKomoditiNama As String
		<Size(50)> _
		Public Property KomoditiNama() As String
			Get
				Return fKomoditiNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KomoditiNama", fKomoditiNama, value)
			End Set
		End Property
		Dim fKapasitas As Integer
		Public Property Kapasitas() As Integer
			Get
				Return fKapasitas
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("Kapasitas", fKapasitas, value)
			End Set
		End Property
		Dim fSatuan As String
		<Size(10)> _
		Public Property Satuan() As String
			Get
				Return fSatuan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Satuan", fSatuan, value)
			End Set
		End Property
		Dim fKeterangan As String
		Public Property Keterangan() As String
			Get
				Return fKeterangan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Keterangan", fKeterangan, value)
			End Set
		End Property
		Dim fJenisKomoditi As String
		<Size(20)> _
		Public Property JenisKomoditi() As String
			Get
				Return fJenisKomoditi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisKomoditi", fJenisKomoditi, value)
			End Set
        End Property
        Dim fKKI As String
        Public Property KKI() As String
            Get
                Return fKKI
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("KKI", fKKI, value)
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
