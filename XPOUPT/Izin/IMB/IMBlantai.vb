Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IMBlantai
		Inherits XPLiteObject
        Dim fIMBlantaiID As Guid
        <Key(True)> _
        Public Property IMBlantaiID() As Guid
            Get
                Return fIMBlantaiID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("IMBlantaiID", fIMBlantaiID, value)
            End Set
        End Property
        
        Dim fIMBID As Guid
        Public Property IMBID() As Guid
            Get
                Return fIMBID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("IMBID", fIMBID, value)
            End Set
        End Property

        Dim fLantai As Integer
        Public Property Lantai() As Integer
            Get
                Return fLantai
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("Lantai", fLantai, value)
            End Set
        End Property

        Dim fLuas As Integer
        Public Property Luas() As Integer
            Get
                Return fLuas
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("Luas", fLuas, value)
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
