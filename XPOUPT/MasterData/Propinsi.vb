Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class Propinsi
        Inherits XPLiteObject
        <Association("Propinsi-Kabupaten")> _
        Dim fPropinsiID As Guid
		<Key(true)> _
		Public Property PropinsiID() As Guid
			Get
				Return fPropinsiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PropinsiID", fPropinsiID, value)
			End Set
		End Property
		Dim fPropinsiNama As String
		<Size(50)> _
		Public Property PropinsiNama() As String
			Get
				Return fPropinsiNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PropinsiNama", fPropinsiNama, value)
			End Set
		End Property
		Dim fPropinsiIbukota As String
		<Size(50)> _
		Public Property PropinsiIbukota() As String
			Get
				Return fPropinsiIbukota
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PropinsiIbukota", fPropinsiIbukota, value)
			End Set
		End Property
		Dim fPropinsiGubernur As String
		<Size(50)> _
		Public Property PropinsiGubernur() As String
			Get
				Return fPropinsiGubernur
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PropinsiGubernur", fPropinsiGubernur, value)
			End Set
        End Property
        <Association("Propinsi-Kabupaten")> _
                Public ReadOnly Property Kabupaten() As XPCollection(Of Kabupaten)
            Get
                Return GetCollection(Of Kabupaten)("Kabupaten")
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
