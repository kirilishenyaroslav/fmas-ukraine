unit U_SP_TypePost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSearchFrame, Buttons, ExtCtrls, Grids, DBGrids, DB, IBase, RXMemDS,
  SpCommon, U_SPPost, U_SP_Post_ChType, U_SP_Post_AddType, U_SPPost_DataModule,
  StdCtrls;

type
  TSP_TypePost = class(TForm)
    Panel1: TPanel;
    SBDelete: TSpeedButton;
    SBModif: TSpeedButton;
    SBAdd: TSpeedButton;
    SBRefresh: TSpeedButton;
    SBSelect: TSpeedButton;
    SBClose: TSpeedButton;
    DataSource1: TDataSource;
    TypePostGrid: TDBGrid;
    SearchFrame: TfmSearch;
    procedure SBAddClick(Sender: TObject);
    procedure SBModifClick(Sender: TObject);
    procedure SBDeleteClick(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure SBCloseClick(Sender: TObject);
    procedure SBSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TypePostGridDblClick(Sender: TObject);
    procedure TypePostGridKeyPress(Sender: TObject; var Key: Char);
    procedure TypePostGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    DMod:TDMSPPost;
    Salary:Boolean;
    table:string;
  end;

var
  SP_TypePost: TSP_TypePost;

function ShowTypePost(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData;Buttons:TFormButtons = fbAll):Boolean;
procedure TypePostSelect(AOwner:TComponent; Handle: TISC_DB_Handle; var Value: Variant; var DisplayText: String);
function ShowSalaryProp(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData;Buttons:TFormButtons = fbAll):Boolean;


implementation

{$R *.dfm}

procedure TypePostSelect(AOwner:TComponent; Handle: TISC_DB_Handle; var Value: Variant; var DisplayText: String);
var Output: TRxMemoryData;
begin
  Output:=TRxMemoryData.Create(AOwner);
  if not ShowTypePost(AOwner,Handle,smSelMod,Output) then Exit;
  Value:=Output['Id_post']; DisplayText:=Output['name'];
end;

function ShowTypePost(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; Buttons:TFormButtons = fbAll):Boolean;
var RForm:TSP_TypePost;
    i:integer;
    ModRes: TModalResult;
begin
  RForm:=TSP_TypePost.Create(AOwner);
  RForm.DMod := TDMSPPost.Create(RForm);
  RForm.DMod.FIBDatabase.Handle := Handle;
  SPInit(Handle);
  RForm.DMod.FIBDS_SPTypePost.SelectSQL.Text:='select * from sp_type_post;';
  RForm.DMod.FIBDS_SPTypePost.Open;
  RForm.SearchFrame.Prepare(RForm.DMod.FIBDS_SPTypePost,RForm.TypePostGrid);
  RForm.Salary:=False;

  if (SM=smShowMChild)or(SM=smShowMod)
   then RForm.SBSelect.Visible:=False;

  if fbAdd in Buttons then
   begin
     RForm.SBAdd.Enabled:=True;
   end  else
   begin
     RForm.SBAdd.Enabled:=False;
   end;

  if fbModif in Buttons then
   begin
     RForm.SBMOdif.Enabled:=True;
   end  else
   begin
     RForm.SBMOdif.Enabled:=False;
   end;

  if fbDel in Buttons then
   begin
     RForm.SBDelete.Enabled:=True;
   end  else
   begin
     RForm.SBDelete.Enabled:=False;
   end;

  if (SM=smMSelMod) then
   RForm.TypePostGrid.Options:=RForm.TypePostGrid.Options+[dgMultiSelect];

  if (SM=smShowMChild)
   then RForm.FormStyle:=fsMDIChild
   else
   begin
     RForm.FormStyle:=fsNormal;
     RForm.Visible:=False;
     ModRes := RForm.ShowModal;
   end;

   if (SM=smMSelMod)or(SM=smSelMod)then
    begin
      if RForm.DMod.FIBDS_SPTypePost.IsEmpty then
      begin
         Result := False;
         //SPDone;
         RForm.Free;
         Exit;
      end;

      if ModRes = mrCancel
       then
       begin
         Result:=False;
         //SPDone;
         RForm.Free;
         Exit;
       end;
      Output.Open;
      if RForm.TypePostGrid.SelectedRows.Count>0 then
       with RForm.DMod.FIBDS_SPTypePost do
       for i:=0 to RForm.TypePostGrid.SelectedRows.Count-1 do
       begin
         GotoBookmark(pointer(RForm.TypePostGrid.SelectedRows.Items[i]));
         Output.Append;
         Output['id_type_post'] := StrToInt(RForm.DMod.FIBDS_SPTypePost['id_type_post']);
         Output['name_type_post'] := RForm.DMod.FIBDS_SPTypePost['name_type_post'];
         Output.Post;
       end
       else begin
         Output.Append;
         Output['id_type_post'] := StrToInt(RForm.DMod.FIBDS_SPTypePost['id_type_post']);
         Output['name_type_post'] := RForm.DMod.FIBDS_SPTypePost['name_type_post'];
         Output.Post;
       end;
      RForm.Free;
    end;
    Result:=True;
end;

function ShowSalaryProp(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; Buttons:TFormButtons = fbAll):Boolean;
var RForm:TSP_TypePost;
    i:integer;
    ModRes: TModalResult;
begin
  RForm:=TSP_TypePost.Create(AOwner);
  RForm.DMod := TDMSPPost.Create(RForm);
  RForm.DMod.FIBDatabase.Handle := Handle;
  SPInit(Handle);
  RForm.DMod.FIBDS_SPTypePost.SelectSQL.Text:='select * from ini_post_properties;';
  RForm.DMod.FIBDS_SPTypePost.Open;
  RForm.SearchFrame.Prepare(RForm.DMod.FIBDS_SPTypePost,RForm.TypePostGrid);
  RForm.Salary:=True;

  if (SM=smShowMChild)or(SM=smShowMod)
   then RForm.SBSelect.Visible:=False;

  if fbAdd in Buttons then
   begin
     RForm.SBAdd.Enabled:=True;
   end  else
   begin
     RForm.SBAdd.Enabled:=False;
   end;

  if fbModif in Buttons then
   begin
     RForm.SBMOdif.Enabled:=True;
   end  else
   begin
     RForm.SBMOdif.Enabled:=False;
   end;

  if fbDel in Buttons then
   begin
     RForm.SBDelete.Enabled:=True;
   end  else
   begin
     RForm.SBDelete.Enabled:=False;
   end;

  if (SM=smMSelMod) then
   RForm.TypePostGrid.Options:=RForm.TypePostGrid.Options+[dgMultiSelect];

  if (SM=smShowMChild)
   then RForm.FormStyle:=fsMDIChild
   else
   begin
     RForm.FormStyle:=fsNormal;
     RForm.Visible:=False;
     ModRes := RForm.ShowModal;
   end;

   if (SM=smMSelMod)or(SM=smSelMod)then
    begin
      if RForm.DMod.FIBDS_SPTypePost.IsEmpty then
      begin
         Result := False;
         RForm.Free;
         Exit;
      end;

      if ModRes = mrCancel
       then
       begin
         Result:=False;
         RForm.Free;
         Exit;
       end;
      Output.Open;
      if RForm.TypePostGrid.SelectedRows.Count>0 then
       with RForm.DMod.FIBDS_SPTypePost do
       for i:=0 to RForm.TypePostGrid.SelectedRows.Count-1 do
       begin
         GotoBookmark(pointer(RForm.TypePostGrid.SelectedRows.Items[i]));
         Output.Append;
         Output['id_properties'] := StrToInt(RForm.DMod.FIBDS_SPTypePost['id_properties']);
         Output['name_properties'] := RForm.DMod.FIBDS_SPTypePost['name_properties'];
         Output.Post;
       end
       else begin
         Output.Append;
         Output['id_properties'] := StrToInt(RForm.DMod.FIBDS_SPTypePost['id_properties']);
         Output['name_properties'] := RForm.DMod.FIBDS_SPTypePost['name_properties'];
         Output.Post;
       end;
      RForm.Free;
    end;
    Result:=True;
end;

procedure TSP_TypePost.SBAddClick(Sender: TObject);
var AForm: TSP_Post_AddType;
    BForm: TSP_Post_ChType;
begin
  if Salary then
   begin
     BForm:=TSP_Post_ChType.Create(Self);
     BForm.DMod:=DMod;
     BForm.field:='properties';
     BForm.Salary:=Salary;
     BForm.table:=table;
     BForm.Add:=True;
     BForm.ShowModal;
     BForm.Free;
   end else
   begin
     AForm := TSP_Post_AddType.Create(Self);
     AForm.DMod:=DMod;
     AForm.ShowModal;
     AForm.Free;
   end;
  SBRefresh.Click;
end;

procedure TSP_TypePost.SBModifClick(Sender: TObject);
var AForm: TSP_Post_ChType;
    field:string;
begin
  field:='type_post';

  if Salary then
   field:='properties';

  if DMod.FIBDS_SPTypePost.IsEmpty
   then begin
     MessageDlg('Не можливо змінити запис бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDS_SPTypePost['Id_'+field]=Null)
   then begin
     MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
     exit;
   end;

  AForm:=TSP_Post_ChType.Create(Self);
  AForm.DMod:=DMod;
  AForm.CE_Name.Text:=DMod.FIBDS_SPTypePost['name_'+field];
  AForm.id:=IntToStr(DMod.FIBDS_SPTypePost['Id_'+field]);
  AForm.field:=field;
  AForm.table:=table;
  AForm.Salary:=Salary;
  AForm.Add:=False;
  AForm.ShowModal;
  AForm.Free;

  SBRefresh.Click;
end;

procedure TSP_TypePost.SBDeleteClick(Sender: TObject);
var field:string;
begin
  field:='type_post';

  if Salary then
   field:='properties';

  if DMod.FIBDS_SPTypePost.IsEmpty
   then begin
     MessageDlg('Не можливо видалити запис бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDS_SPTypePost['id_'+field]=Null)
   then begin
     MessageDlg('Не можливо видалити пустий запис',mtError,[mbYes],0);
     exit;
   end;
  if (MessageDlg('Чи ви справді бажаєте вилучити запис "'+
           DMod.FIBDS_SPTypePost['name_'+field]+'"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure '+table+'Delete('+IntToStr(FIBDS_SPTypePost['Id_'+field])+');';
    FIBQuery.ExecProc;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося вилучити запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
        error:=True;
  end;
  end;
  SBRefreshClick(Sender);
end;

procedure TSP_TypePost.SBRefreshClick(Sender: TObject);
var field:string;
    id:integer;
begin
  field:='Id_type_post';

  if Salary then
   field:='id_properties';

  if DMod.FIBDS_SPTypePost[field]=Null then
   begin
     DMod.FIBDS_SPTypePost.Close;
     DMod.FIBDS_SPTypePost.Open;
     SearchFrame.Refresh;
     TypePostGrid.Refresh;
     Exit;
   end;

  id:=DMod.FIBDS_SPTypePost[field];

  DMod.FIBDS_SPTypePost.Close;
  DMod.FIBDS_SPTypePost.Open;
  SearchFrame.Refresh;
  TypePostGrid.Refresh;

  DMod.FIBDS_SPTypePost.Locate(field, Id, []);
end;

procedure TSP_TypePost.SBCloseClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	Close;
end;

procedure TSP_TypePost.SBSelectClick(Sender: TObject);
begin
	ModalResult := mrOk;
//	Close;
end;

procedure TSP_TypePost.FormShow(Sender: TObject);
begin
  table:='sp_type_post_';
  if Salary then
   begin
     Self.Caption:='Довідник властивостей базових окладів';
     TypePostGrid.Columns[0].FieldName:='name_properties';
     TypePostGrid.Columns[0].Title.Caption:='Назва властивості';
     table:='ini_post_properties_';
   end;
  DataSource1.DataSet:=DMod.FIBDS_SPTypePost;
  SearchFrame.Prepare(DMod.FIBDS_SPTypePost,TypePostGrid);
  GridResize(TypePostGrid);
end;

procedure TSP_TypePost.FormResize(Sender: TObject);
begin
  GridResize(TypePostGrid);
end;

procedure TSP_TypePost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 	if FormStyle = fsMDIChild then
   begin
     Action := caFree;
   end;
end;

procedure TSP_TypePost.TypePostGridDblClick(Sender: TObject);
begin
  if SBSelect.Visible then
   SBSelect.Click else
   SBModif.Click;
end;

procedure TSP_TypePost.TypePostGridKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(Key) > 31  then
        SearchFrame.SearchEdit.Text := SearchFrame.SearchEdit.Text + Key;
end;

procedure TSP_TypePost.TypePostGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var Text: String;
    i:integer;
begin
    if Key = VK_RETURN then SBSelect.Click;

    if Key = VK_BACK then SearchFrame.SearchEdit.Text := '';

    if ( Key = VK_F12) and (ssShift in Shift) then
     try
       text:='';
       for i:=1 to DMod.FIBDS_SPPost.Fields.Count do
         text:=text+DMod.FIBDS_SPPost.Fields[i-1].FieldName+' : '+DMod.FIBDS_SPPost.Fields[i-1].DisplayText+#13;

        ShowMessage(text);

    except
    end;
end;

end.
