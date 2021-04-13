Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOAlat
		Inherits XPLiteObject
		Dim fAlatID As Guid
		<Key(true)> _
		Public Property AlatID() As Guid
			Get
				Return fAlatID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("AlatID", fAlatID, value)
			End Set
        End Property
        Dim fHOID As HO
        Public Property HOID() As HO
            Get
                Return fHOID
            End Get
            Set(ByVal value As HO)
                SetPropertyValue(Of HO)("HOID", fHOID, value)
            End Set
        End Property
		Dim fNamaAlat As String
		<Size(50)> _
		Public Property NamaAlat() As String
			Get
				Return fNamaAlat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaAlat", fNamaAlat, value)
			End Set
		End Property
		Dim fJumlahAlat As Integer
		Public Property JumlahAlat() As Integer
			Get
				Return fJumlahAlat
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("JumlahAlat", fJumlahAlat, value)
			End Set
		End Property
		Dim fKapasitasAlat As Integer
		Public Property KapasitasAlat() As Integer
			Get
				Return fKapasitasAlat
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("KapasitasAlat", fKapasitasAlat, value)
			End Set
		End Property
		Dim fKeteranganAlat As String
		<Size(50)> _
		Public Property KeteranganAlat() As String
			Get
				Return fKeteranganAlat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KeteranganAlat", fKeteranganAlat, value)
			End Set
        End Property

        Dim fNoAlatAsalBarang As String
        Public Property NoAlatAsalBarang() As String
            Get
                Return fNoAlatAsalBarang
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoAlatAsalBarang", fNoAlatAsalBarang, value)
            End Set
        End Property
        Dim fSatuan As String
        Public Property Satuan() As String
            Get
                Return fSatuan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Satuan", fSatuan, value)
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
