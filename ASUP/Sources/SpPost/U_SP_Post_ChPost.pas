{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль изменения должности  в категории                      }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_ChPost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FieldControl, SpComboBox, EditControl,
  SpCommon, U_SPPost_DataModule, Grids, DBGrids, DB, FIBDataSet,
  pFIBDataSet;

type
  TSP_Post_ChPost = class(TForm)
    Label3: TLabel;
    SpCB_Cat: TSpComboBox;
    FC_Cat: TFieldControl;
    DTP_End: TDateTimePicker;
    Label2: TLabel;
    DTP_Beg: TDateTimePicker;
    Label1: TLabel;
    Label5: TLabel;
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    DataSource1: TDataSource;
    pFIBDS: TpFIBDataSet;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbCancelClick(Sender: TObject);
    procedure SbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FormControl: TEditControl;
  public
    DMod:TDMSPPost;
    id, id_post:integer;
  end;

var
  SP_Post_ChPost: TSP_Post_ChPost;

implementation

{$R *.dfm}

procedure TSP_Post_ChPost.FormCreate(Sender: TObject);
begin
  DMod := TDMSPPost.Create(Self);
  FormControl := TEditControl.Create;
  FormControl.Add([FC_Cat]);
  FormControl.Prepare(emNew);
  SpCB_Cat.LoadFromRegistry;
end;

procedure TSP_Post_ChPost.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormControl.Free;
  SpCB_Cat.SaveIntoRegistry;
end;

procedure TSP_Post_ChPost.SbCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
  Close;
end;

procedure TSP_Post_ChPost.SbOkClick(Sender: TObject);
begin
  FormControl.Read;

  if not FormControl.CheckFill then
  begin
    ModalResult := 0;
    Exit;
  end;

  with DMod do
  try
    FIBQuery.SQL.Text:='execute procedure sp_post_category_update(:id_post_category,:id_post,:id_category,:date_beg,:date_end);';
    FIBQuery.ParamByName('id_category').AsInteger:=SpCB_Cat.GetId;
    FIBQuery.ParamByName('date_beg').AsDate:=DTP_Beg.Date;
    FIBQuery.ParamByName('date_end').AsDate:=DTP_End.Date;
    FIBQuery.ParamByName('id_post').AsInteger:=id_post;
    FIBQuery.ParamByName('id_post_category').AsInteger:=id;
    FIBWriteTransaction.StartTransaction;
    FIBQuery.ExecProc;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося додати запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
        error:=True;
  end;
  end;
end;

procedure TSP_Post_ChPost.FormShow(Sender: TObject);
begin
  GridResize(DBGrid1);
  SPInit(DMod.FIBDatabase.Handle);
  pFIBDS.Database:=DMod.FIBDatabase;
  pFIBDS.ParamByName('id_post').AsInteger:=id_post;
  pFIBDS.Open;
end;

procedure TSP_Post_ChPost.FormDestroy(Sender: TObject);
begin
  //SPDone;
end;

end.
