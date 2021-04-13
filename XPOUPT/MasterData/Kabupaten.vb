Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class Kabupaten
        Inherits XPLiteObject

        Dim fKabupatenID As Guid
        <Key(True)> _
        <Association("Kabupaten-Kecamatan")> _
        Public Property KabupatenID() As Guid
            Get
                Return fKabupatenID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("KabupatenID", fKabupatenID, value)
            End Set
        End Property

        Dim fKabupatenPropinsiID As Propinsi
        <Association("Propinsi-Kabupaten")> _
        Public Property KabupatenPropinsiID() As Propinsi
            Get
                Return fKabupatenPropinsiID
            End Get
            Set(ByVal value As Propinsi)
                SetPropertyValue(Of Propinsi)("KabupatenPropinsiID", fKabupatenPropinsiID, value)
            End Set
        End Property
		Dim fKabupatenNama As String
		<Size(50)> _
		Public Property KabupatenNama() As String
			Get
				Return fKabupatenNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KabupatenNama", fKabupatenNama, value)
			End Set
        End Property
        Dim fKabupatenKota As String
        <Size(50)> _
        Public Property KabupatenKota() As String
            Get
                Return fKabupatenKota
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("KabupatenKota", fKabupatenKota, value)
            End Set
        End Property
		Dim fKabupatenBupati As String
		<Size(50)> _
		Public Property KabupatenBupati() As String
			Get
				Return fKabupatenBupati
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KabupatenBupati", fKabupatenBupati, value)
			End Set
        End Property
        <Association("Kabupaten-Kecamatan")> _
        Public ReadOnly Property Kecamatan() As XPCollection(Of Kecamatan)
            Get
                Return GetCollection(Of Kecamatan)("Kecamatan")
            End Get
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
