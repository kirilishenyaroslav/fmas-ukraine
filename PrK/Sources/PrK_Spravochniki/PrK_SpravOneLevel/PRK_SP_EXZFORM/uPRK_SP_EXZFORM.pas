unit uPRK_SP_EXZFORM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrK_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar;

type
  TFormPRK_SP_EXZFORM = class(TFormPrK_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPRK_SP_EXZFORM: TFormPRK_SP_EXZFORM;

implementation
uses
   uPrK_Resources,uConstants;

{$R *.dfm}

procedure TFormPRK_SP_EXZFORM.FormCreate(Sender: TObject);
begin
  inherited;
  {ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_EKZFORM';
  SelectSQLText        :='Select * from PRK_SP_EKZFORM_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_EKZFORM_ADD';
  StoredProcChangeName :='PRK_SP_EKZFORM_CHANGE';
  StoredProcDelName    :='PRK_SP_EKZFORM_DEL';
  NamePrKSpravEdit     := PrKSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_EXZFORM_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
