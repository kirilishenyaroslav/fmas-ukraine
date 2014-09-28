unit U_SP_Cat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSearchFrame, Grids, DBGrids, DB, Buttons, ExtCtrls, U_SPPost,
  U_SPPost_DataModule, U_SP_Post_AddCat, IBase, RXMemDS,  SpCommon;

type
  TSP_Cat = class(TForm)
    Panel1: TPanel;
    SBDelete: TSpeedButton;
    SBModif: TSpeedButton;
    SBAdd: TSpeedButton;
    SBRefresh: TSpeedButton;
    SBSelect: TSpeedButton;
    SBClose: TSpeedButton;
    SpeedButtonDown: TSpeedButton;
    SpeedButtonUp: TSpeedButton;
    DataSource1: TDataSource;
    CategoryGrid: TDBGrid;
    SearchFrame: TfmSearch;
    procedure SBAddClick(Sender: TObject);
    procedure SBModifClick(Sender: TObject);
    procedure SBDeleteClick(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure SpeedButtonDownClick(Sender: TObject);
    procedure SpeedButtonUpClick(Sender: TObject);
    procedure SBCloseClick(Sender: TObject);
    procedure SBSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CategoryGridDblClick(Sender: TObject);
    procedure CategoryGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CategoryGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    DMod:TDMSPPost;{ Public declarations }
  end;

var
  SP_Cat: TSP_Cat;

function ShowCat(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData;Buttons:TFormButtons = fbAll):Boolean;
procedure CatSelect(AOwner:TComponent; Handle: TISC_DB_Handle; var Value: Variant; var DisplayText: String);

implementation

{$R *.dfm}

procedure CatSelect(AOwner:TComponent; Handle: TISC_DB_Handle; var Value: Variant; var DisplayText: String);
var Output: TRxMemoryData;
begin
  Output:=TRxMemoryData.Create(AOwner);
  if not ShowCat(AOwner,Handle,smSelMod,Output) then Exit;
  Value:=Output['Id_post']; DisplayText:=Output['name'];
end;

function ShowCat(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; Buttons:TFormButtons = fbAll):Boolean;
var RForm:TSP_Cat;
    i:integer;
    ModRes: TModalResult;
begin
  RForm:=TSP_Cat.Create(AOwner);
  RForm.DMod := TDMSPPost.Create(RForm);
  RForm.DMod.FIBDatabase.Handle := Handle;
  SPInit(Handle);
  RForm.DMod.FIBDS_SPCategory.Open;
  RForm.SearchFrame.Prepare(RForm.DMod.FIBDS_SPCategory,RForm.CategoryGrid);


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
   RForm.CategoryGrid.Options:=RForm.CategoryGrid.Options+[dgMultiSelect];

  if (SM=smShowMChild)
   then RForm.FormStyle:=fsMDIChild
   else
   begin
     RForm.FormStyle:=fsNormal;
     RForm.Visible:=False;
     ModRes := RForm.ShowModal;
   end;

   Result:=True;
   if (SM=smMSelMod)or(SM=smSelMod)then
    begin
      if RForm.DMod.FIBDS_SPCategory.IsEmpty then
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
      if RForm.CategoryGrid.SelectedRows.Count>0 then
       with RForm.DMod.FIBDS_SPCategory do
       for i:=0 to RForm.CategoryGrid.SelectedRows.Count-1 do
       begin
         GotoBookmark(pointer(RForm.CategoryGrid.SelectedRows.Items[i]));
         Output.Append;
         Output['Id_category'] := StrToInt(RForm.DMod.FIBDS_SPCategory['ID_category']);
         Output['Name_category'] := RForm.DMod.FIBDS_SPCategory['Name_category'];
         Output.Post;
       end
       else begin
         Output.Append;
         Output['ID_category'] := StrToInt(RForm.DMod.FIBDS_SPCategory['ID_category']);
         Output['Name_category'] := RForm.DMod.FIBDS_SPCategory['Name_category'];
         Output.Post;
       end;
      RForm.Free;
    end;
    Result:=True;
end;

procedure TSP_Cat.SBAddClick(Sender: TObject);
var AForm: TSP_Post_AddCat;
begin
  AForm := TSP_Post_AddCat.Create(Self);
  AForm.Add:=True;
  AForm.DMod:=DMod;
  AForm.ShowModal;
  AForm.Free;
  
end;

procedure TSP_Cat.SBModifClick(Sender: TObject);
var AForm: TSP_Post_AddCat;
begin
  if DMod.FIBDS_SPCategory.IsEmpty
   then begin
     MessageDlg('Не можливо змінити запис бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDS_SPCategory['Id_category']=Null)
   then begin
     MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
     exit;
   end;

  AForm := TSP_Post_AddCat.Create(Self);
  AForm.DMod:=DMod;
  AForm.Add:=False;
  AForm.CE_Name.Text:=DMod.FIBDS_SPCategory['name_category'];
  AForm.id:=IntToStr(DMod.FIBDS_SPCategory['id_category']);
  if DMod.FIBDS_SPCategory['VYSLUGA']='T'
   then AForm.CB_v.Checked:=True;
  if DMod.FIBDS_SPCategory['ozdorovlenie']='T'
   then AForm.CB_o.Checked:=True;
  AForm.Caption:='Змінити категорію';
  AForm.ShowModal;
  AForm.Free;
  SBRefresh.Click;
end;

procedure TSP_Cat.SBDeleteClick(Sender: TObject);
begin
  if DMod.FIBDS_SPCategory.IsEmpty
   then begin
     MessageDlg('Не можливо видалити запис бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDS_SPCategory['Id_CATEGORY']=Null)
   then begin
     MessageDlg('Не можливо видалити пустий запис',mtError,[mbYes],0);
     exit;
   end;
  if (MessageDlg('Чи ви справді бажаєте вилучити запис "'+
           DMod.FIBDS_SPCategory['Name_category']+'"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure SP_category_Delete('+IntToStr(FIBDS_SPCategory['Id_category'])+');';
    FIBQuery.ExecProc;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося вилучити запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
        error:=True;
  end;
  end;
  SBRefresh.Click;
end;

procedure TSP_Cat.SBRefreshClick(Sender: TObject);
var id:integer;
begin
  if DMod.FIBDS_SPCategory['Id_category']=Null then
   begin
     DMod.FIBDS_SPCategory.Close;
     DMod.FIBDS_SPCategory.Open;
     SearchFrame.Refresh;
     CategoryGrid.Refresh;
     Exit;
   end;

  id:=DMod.FIBDS_SPCategory['Id_category'];

  DMod.FIBDS_SPCategory.Close;
  DMod.FIBDS_SPCategory.Open;
  SearchFrame.Refresh;
  CategoryGrid.Refresh;

  DMod.FIBDS_SPCategory.Locate('Id_category', Id, []);
end;

procedure TSP_Cat.SpeedButtonDownClick(Sender: TObject);
var id1,id2,do1,do2:integer;
begin
     if DMod.FIBDS_SPCategory.IsEmpty then
      begin
        MessageDlg('Не можливо змінити запис бо довідник пустий',mtError,[mbYes],0);
        exit;
      end;
     if (DMod.FIBDS_SPCategory['Id_CATEGORY']=Null) then
      begin
        MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
        exit;
      end;

     id1:=DMod.FIBDS_SPCategory['Id_CATEGORY'];
     do1:=DMod.FIBDS_SPCategory['display_order'];
     DMod.FIBDS_SPCategory.Next;
     id2:=DMod.FIBDS_SPCategory['Id_CATEGORY'];
     do2:=DMod.FIBDS_SPCategory['display_order'];
     DMod.FIBDS_SPCategory.Prior;

     if (id1=id2) then
      begin
        MessageDlg('Не можливо змінити порядок на менший, бо цей запис останній',mtError,[mbYes],0);
        exit;
      end;

     with DMod do
     try
       FIBWriteTransaction.StartTransaction;
       FIBQuery.SQL.Text:='execute procedure sp_category_chorder('+IntToStr(id1)+','+IntToStr(id2)+','+IntToStr(do1)+','+IntToStr(do2)+');';
       FIBQuery.ExecProc;
       FIBWriteTransaction.Commit;
     except on e: Exception do
     begin
       MessageDlg('Не вдалося змінити порядок: '+e.Message,mtError,[mbYes],0);
       FIBWriteTransaction.RollBack;
           error:=True;
     end;
     end;
  SBRefresh.Click;
end;

procedure TSP_Cat.SpeedButtonUpClick(Sender: TObject);
var id1,id2,do1,do2:integer;
begin
     if DMod.FIBDS_SPCategory.IsEmpty then
      begin
        MessageDlg('Не можливо змінити запис бо довідник пустий',mtError,[mbYes],0);
        exit;
      end;
     if (DMod.FIBDS_SPCategory['Id_CATEGORY']=Null) then
      begin
        MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
        exit;
      end;

     id1:=DMod.FIBDS_SPCategory['Id_CATEGORY'];
     do1:=DMod.FIBDS_SPCategory['display_order'];
     DMod.FIBDS_SPCategory.Prior;
     id2:=DMod.FIBDS_SPCategory['Id_CATEGORY'];
     do2:=DMod.FIBDS_SPCategory['display_order'];
     DMod.FIBDS_SPCategory.Next;

     if (id1=id2) then
      begin
        MessageDlg('Не можливо змінити порядок на більший, бо цей запис перший',mtError,[mbYes],0);
        exit;
      end;

     with DMod do
     try
       FIBWriteTransaction.StartTransaction;
       FIBQuery.SQL.Text:='execute procedure sp_category_chorder('+IntToStr(id1)+','+IntToStr(id2)+','+IntToStr(do1)+','+IntToStr(do2)+');';
       FIBQuery.ExecProc;
       FIBWriteTransaction.Commit;
     except on e: Exception do
     begin
       MessageDlg('Не вдалося змінити порядок: '+e.Message,mtError,[mbYes],0);
       FIBWriteTransaction.RollBack;
           error:=True;
     end;
     end;
       SBRefresh.Click;

end;

procedure TSP_Cat.SBCloseClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	Close;
end;

procedure TSP_Cat.SBSelectClick(Sender: TObject);
begin
	ModalResult := mrOk;
//	Close;
end;

procedure TSP_Cat.FormShow(Sender: TObject);
begin
  DataSource1.DataSet:=DMod.FIBDS_SPCategory;
  SearchFrame.Prepare(DMod.FIBDS_SPCategory,CategoryGrid);
  GridResize(CategoryGrid);
end;

procedure TSP_Cat.FormResize(Sender: TObject);
begin
  GridResize(CategoryGrid);
end;

procedure TSP_Cat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 	if FormStyle = fsMDIChild then
   begin
     //SPDone;
     Action := caFree;
   end;
end;

procedure TSP_Cat.CategoryGridDblClick(Sender: TObject);
begin
  if SBSelect.Visible then
   SBSelect.Click;
end;

procedure TSP_Cat.CategoryGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var Text: String;
    i:integer;
begin
    if CategoryGrid.Focused and ( Key = VK_RETURN ) then  SBSelect.Click;
    
    if Key = VK_BACK then SearchFrame.SearchEdit.Text := '';

    if ( Key = VK_F12) and (ssShift in Shift) then
     try
       text:='';
       for i:=1 to DMod.FIBDS_SPCategory.Fields.Count do
         text:=text+DMod.FIBDS_SPCategory.Fields[i-1].FieldName+' : '+DMod.FIBDS_SPCategory.Fields[i-1].DisplayText+#13;
        ShowMessage(text);
    except
    end;
end;

procedure TSP_Cat.CategoryGridKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(Key) > 31  then
        SearchFrame.SearchEdit.Text := SearchFrame.SearchEdit.Text + Key;
end;

end.
