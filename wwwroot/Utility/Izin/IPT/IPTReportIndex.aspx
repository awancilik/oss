<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="IPTReportIndex.aspx.vb" Inherits="Utility_Izin_IPT_IPTReportIndex" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<h1>
        IPT Report Index
 </h1>
    <div class="main_menu">
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton" runat="server" PostBackUrl="~/report/parameterPage/IPT/KeputusanIPT.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan IMB" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Keputusan IPT</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat keputusan Izin Perubahan Tanah<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/report/parameterPage/IPT/RekapitulasiIPT.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan IMB" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Rekapitulasi IPT</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Petikan Izin Perubahan Tanah<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <%--<div class="left clearfix">
                <asp:LinkButton ID="PenerbitanIzinLinkButton" runat="server" PostBackUrl="~/report/parameterPage/IPT/JmlIPT.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Penerbitan IPT</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan penerbitan Izin Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>--%>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/IPT/SKRDIPT.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;"/>
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Retribusi IPT</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan Retribusi Izin Perubahan Tanah<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
        <%--<div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/report/parameterPage/IPT/SKRDIPT.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan SKRD IPT</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan SKRD Izin Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>--%>
    </div>
</asp:Content>

