{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник надбавок"                             }
{                 Работа со справочником надбавок                              }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, uSearchFrame, ExtCtrls, U_DataModule, DB,
  U_SP_Post_Add, Buttons, RxMemDS, FIBDatabase, pFIBDatabase, IBase, SpCommon,
  ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxClasses, cxControls, StdCtrls;

type
  TOldSP_Post = class(TForm)
    Panel1: TPanel;
    DataSource: TDataSource;
    SBAdd: TSpeedButton;
    SBModif: TSpeedButton;
    SBDelete: TSpeedButton;
    SBSelect: TSpeedButton;
    SBClose: TSpeedButton;
    SBRefresh: TSpeedButton;
    SearchFrame: TfmSearch;
    DBGrid: TDBGrid;
    procedure SBDeleteClick(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure SBAddClick(Sender: TObject);
    procedure SBModifClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SBSelectClick(Sender: TObject);
    procedure SBCloseClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    procedure ModifPost;
    procedure DelPost;
  public
    { Public declarations }
  end;

type TShowMode = (smShowMod, smShowMChild, smSelMod, smSelMChild, smMSelMod, smMSelMChild);
     TFormBtn  = (fbAdd, fbModif, fbDel);
     TFormButtons = set of TFormBtn;

const fbAll = [fbAdd, fbModif, fbDel];

var
  OldSP_Post: TOldSP_Post;

function ShowPost(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; Buttons:TFormButtons = fbAll):Boolean;

implementation

{$R *.dfm}

procedure TOldSP_Post.ModifPost;
var FormAdd: TSP_Post_Add;
begin
  FormAdd:=TSP_Post_Add.Create(Self);
  with FormAdd do
  begin
    Add:=False;
    Caption:='Змінити посаду';

    id:=IntToStr(DMod.FIBDataSet['Id_post']);
    CE_Name.Text:=DMod.FIBDataSet['Name_post'];
    if DMod.FIBDataSet['not_digit']='T'
     then CB_Spec.Checked:=True;
    ShowModal;
    Free;
  end;
end;

procedure TOldSP_Post.DelPost;
begin
  if (MessageDlg('Чи ви справді бажаєте вилучити запис "'+DMod.FIBDataSet['Name_post']+
                 '"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;

  with DMod do
   try
     FIBWriteTransaction.StartTransaction;
     FIBQuery.SQL.Text:='execute procedure sp_post_Delete('+IntToStr(FIBDataSet['Id_post'])+');';
     FIBQuery.ExecProc;
     FIBWriteTransaction.Commit;
   except on e: Exception do
   begin
     MessageDlg('Не вдалося вилучити запис: '+e.Message,mtError,[mbYes],0);
     FIBWriteTransaction.RollBack;
   end;  
   end;
end;

procedure TOldSP_Post.SBDeleteClick(Sender: TObject);
var i,count:integer;
begin
  if DMod.FIBDataSet.IsEmpty then
   begin
     MessageDlg('Не можливо видалити запис бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  count := DBGrid.SelectedRows.Count;
  if count>0 then
   with DMod.FIBDataSet do
   begin
     if count>1 then
     if (MessageDlg('Чи ви справді бажаєте вилучити кілька записів?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;

     for i:=0 to count-1 do
     begin

       DelPost;
     end;
   end
   else DelPost;

  SBRefresh.Click;
end;

procedure TOldSP_Post.SBRefreshClick(Sender: TObject);
var id:integer;
begin
  with DMod do
  begin
  if FIBDataSet['Id_raise']=Null then
   begin
     FIBDataSet.Close;
     FIBDataSet.Open;
     SearchFrame.Refresh;
     DBGrid.Refresh; Exit;
   end;

  id:=FIBDataSet['Id_raise'];

  FIBDataSet.Close;
  FIBDataSet.Open;
  SearchFrame.Refresh;
  DBGrid.Refresh;
  FIBDataSet.Locate('Id_RAISE', Id, []);
  end;
end;

procedure TOldSP_Post.SBAddClick(Sender: TObject);
var FormAdd: TSP_Post_Add;
begin
  FormAdd:=TSP_Post_Add.Create(Self);
  with FormAdd do
  begin
    Add:=True;
    ShowModal;
    Free;
  end;  
  SBRefresh.Click;
end;

procedure TOldSP_Post.SBModifClick(Sender: TObject);
var i,count:integer;
begin
  if DMod.FIBDataSet.IsEmpty
   then begin
     MessageDlg('Не можливо змінити запис бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  count := DBGrid.SelectedRows.Count;
  if count>0 then
   with DMod.FIBDataSet do
     for i:=0 to count-1 do
     begin

       ModifPost;
     end
   else ModifPost;

  SBRefresh.Click;
end;

procedure TOldSP_Post.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 	if FormStyle = fsMDIChild then Action := caFree;
end;

function ShowPost(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData;  Buttons:TFormButtons = fbAll):Boolean;
var RForm:TSP_Post;
    i,count:integer;
    ModRes: TModalResult;
begin
  DMod := TDMod.Create(AOwner);
  DMod.FIBDatabase.Handle := Handle;
  RForm:=TSP_Post.Create(AOwner);
  DMod.FIBDataSet.SelectSQL.Clear;
  DMod.FIBDataSet.SelectSQL.Add('select * from sp_post_univer_select;');
  DMod.FIBDataSet.Open;

  if (SM=smShowMChild)or(SM=smShowMod)
   then RForm.SBSelect.Visible:=False;

  if fbAdd in Buttons then
     RForm.SBAdd.Enabled:=True
   else
     RForm.SBModif.Enabled:=False;

  if fbModif in Buttons then
     RForm.SBMOdif.Enabled:=True
   else
     RForm.SBMOdif.Enabled:=False;

  if fbDel in Buttons then
     RForm.SBDelete.Enabled:=True
   else
     RForm.SBDelete.Enabled:=False;

//  if (SM=smMSelMChild)or(SM=smMSelMod) then
//   RForm.DBGridDBTableView1.OptionsSelection.MultiSelect:=True;

  if (SM=smShowMChild)or(SM=smSelMChild)or(SM=smMSelMChild)
   then RForm.FormStyle:=fsMDIChild
   else
   begin
     RForm.FormStyle:=fsNormal;
     RForm.Visible:=False;
     ModRes := RForm.ShowModal;
   end;

   if (SM=smMSelMChild)or(SM=smMSelMod)or(SM=smSelMChild)or(SM=smSelMod)then
    begin
      if DMod.FIBDataSet.IsEmpty then
      begin
         Result := False;
         dMod.Free;
         Exit;
      end;

      if ModRes = mrCancel
       then
       begin
         Result:=False;
         dMod.Free;
         Exit;
       end;
      Output.FieldDefs.Add('Id_Post',ftInteger);
      Output.FieldDefs.Add('Name', ftString, 50);
      Output.Open;
      count := RForm.DBGrid.SelectedRows.Count;
      if count>0 then
       with DMod.FIBDataSet do
       for i:=0 to count-1 do
       begin

         Output.Append;
         Output['Id_Post'] := StrToInt(DMod.FIBDataSet['ID_Post']);
         Output['Name'] := DMod.FIBDataSet['Name_Post'];
         Output.Post;
       end
       else begin
         Output.Append;
         Output['Id_Post'] := StrToInt(DMod.FIBDataSet['ID_Post']);
         Output['Name'] := DMod.FIBDataSet['Name_Post'];
         Output.Post;
       end;
    end;
    Result:=True;
    RForm.Free;
    dMod.Free;
end;

procedure TOldSP_Post.FormCreate(Sender: TObject);
begin
  SearchFrame.Prepare(DMod.FIBDataSet,nil);
end;

procedure TOldSP_Post.SBSelectClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TOldSP_Post.SBCloseClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TOldSP_Post.DBGridDblClick(Sender: TObject);
begin
    SBSelect.Click;
end;
end.
