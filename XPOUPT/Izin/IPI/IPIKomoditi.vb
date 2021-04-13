Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPIKomoditi
		Inherits XPLiteObject
		Dim fKomoditiID As Guid
		<Key(true)> _
		Public Property KomoditiID() As Guid
			Get
				Return fKomoditiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("KomoditiID", fKomoditiID, value)
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
		Dim fKomoditi As String
		<Size(50)> _
		Public Property Komoditi() As String
			Get
				Return fKomoditi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Komoditi", fKomoditi, value)
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
        Dim fKapasitasSebelum As Integer
        Public Property KapasitasSebelum() As Integer
            Get
                Return fKapasitasSebelum
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("KapasitasSebelum", fKapasitasSebelum, value)
            End Set
        End Property
		Dim fSatuan As String
		<Size(15)> _
		Public Property Satuan() As String
			Get
				Return fSatuan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Satuan", fSatuan, value)
			End Set
		End Property
		Dim fKeterangan As String
		<Size(150)> _
		Public Property Keterangan() As String
			Get
				Return fKeterangan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Keterangan", fKeterangan, value)
			End Set
        End Property
        Dim fKKI As String
        <Size(150)> _
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
