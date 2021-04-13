Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiHDPPT
		Inherits XPLiteObject
		Dim fLokasiHDPPTID As Guid
		<Key(true)> _
		Public Property LokasiHDPPTID() As Guid
			Get
				Return fLokasiHDPPTID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiHDPPTID", fLokasiHDPPTID, value)
			End Set
		End Property
        Dim fPeruntukan As String
        <Size(20)> _
        Public Property Peruntukan() As String
            Get
                Return fPeruntukan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Peruntukan", fPeruntukan, value)
            End Set
        End Property
		Dim fJenis As String
		<Size(10)> _
		Public Property Jenis() As String
			Get
				Return fJenis
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Jenis", fJenis, value)
			End Set
		End Property
		Dim fHarga As Decimal
		Public Property Harga() As Decimal
			Get
				Return fHarga
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Harga", fHarga, value)
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
