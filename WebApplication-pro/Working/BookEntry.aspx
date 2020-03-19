<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="BookEntry.aspx.cs" Inherits="WebApplication_pro.Working.BookEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <br />
        <br />
        <br />

      <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label1" AssociatedControlID="txtBookName" runat="server" Text="Book Name"></asp:Label>
            </div>

            <div class="col-md-5">
                <asp:TextBox ID="txtBookName" runat="server" placeholder="Enter Book Name" CssClass="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBookName" ErrorMessage="Required!!" ForeColor="Red" ValidationGroup="Book"></asp:RequiredFieldValidator>


            </div>

        </div>

        <br />

      <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label4" AssociatedControlID="txtAuthorName" runat="server" Text="Author Name"></asp:Label>
            </div>

            <div class="col-md-5">
                <asp:TextBox ID="txtAuthorName" runat="server" CssClass="form-control" placeholder="Author Book Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAuthorName" ErrorMessage="Required!!" ForeColor="Red" ValidationGroup="Book"></asp:RequiredFieldValidator>
            </div>

        </div>

        <br />
       <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label2" AssociatedControlID="FileUpload1" runat="server" Text="Book CoverPicture"></asp:Label>
            </div>

            <div class="col-md-5">
                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Required!!" ForeColor="Red" ValidationGroup="Book"></asp:RequiredFieldValidator>
            </div>

        </div>

        <br />
         <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label3" AssociatedControlID="DropDownList1" runat="server" Text="Book Category"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AspProjectConnectionString %>" SelectCommand="SELECT * FROM [Book_Category]"></asp:SqlDataSource>
            </div>

<%--            <div class="col-md-5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="DropDownList1" ErrorMessage="Required!!" ForeColor="Red" ></asp:RequiredFieldValidator>
            </div>--%>

        </div>

        <br />
          <br />

         <div class="row">
            <div class="col-md-2">
           
            </div>

            <div class="col-md-5">
                <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Insert" OnClick="Button1_Click" ValidationGroup="Book" />
            </div>

        </div>
        <br />
        <br />
        
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="BookId" DataSourceID="SqlDataSource2" Height="161px" Width="281px" OnItemInserting="DetailsView1_ItemInserting" OnItemUpdating="DetailsView1_ItemUpdating">
            <Fields>
                <asp:TemplateField HeaderText="BookId" InsertVisible="False" SortExpression="BookId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="BookName" SortExpression="BookName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BookName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AuthorName" SortExpression="AuthorName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AuthorName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AuthorName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("AuthorName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CoverPage" SortExpression="CoverPage">
                    <EditItemTemplate>
                         <asp:FileUpload ID="fuUpdate"  runat="server" />
                       
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:FileUpload ID="fuInsert"  runat="server" />
                       
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="show_image" Height="150" Width="150" ImageUrl='<%# Bind("CoverPage") %>' runat="server" />
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CoverPicName" SortExpression="CoverPicName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CoverPicName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CoverPicName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CoverPicName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CategoryId" SortExpression="CategoryId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CategoryId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CategoryId") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("CategoryId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AspProjectConnectionString %>" 
            DeleteCommand="DELETE FROM [Book] WHERE [BookId] = @BookId"
            InsertCommand="INSERT INTO [Book] ([BookName], [AuthorName], [CoverPage], [CoverPicName], [CategoryId]) VALUES (@BookName, @AuthorName, @CoverPage, @CoverPicName, @CategoryId)" SelectCommand="SELECT * FROM [Book]"
            UpdateCommand="UPDATE [Book] SET [BookName] = @BookName, [AuthorName] = @AuthorName, [CoverPage] = @CoverPage, [CoverPicName] = @CoverPicName, [CategoryId] = @CategoryId WHERE [BookId] = @BookId">
            <DeleteParameters>
                <asp:Parameter Name="BookId" Type="Int32" />
                
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BookName" Type="String" />
                <asp:Parameter Name="AuthorName" Type="String" />
                <asp:Parameter Name="CoverPage" Type="String" />
                <asp:Parameter Name="CoverPicName" Type="String" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BookName" Type="String" />
                <asp:Parameter Name="AuthorName" Type="String" />
                <asp:Parameter Name="CoverPage" Type="String" />
                <asp:Parameter Name="CoverPicName" Type="String" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
                <asp:Parameter Name="BookId" Type="Int32" />
               
            </UpdateParameters>
        </asp:SqlDataSource>
        
        <br />
        
        <br />
</div>
</asp:Content>
