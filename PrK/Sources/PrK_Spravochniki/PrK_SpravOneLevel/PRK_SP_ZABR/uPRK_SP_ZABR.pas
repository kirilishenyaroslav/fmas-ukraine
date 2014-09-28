unit uPRK_SP_ZABR;

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
  TFormPRK_SP_ZABR = class(TFormPrK_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPRK_SP_ZABR: TFormPRK_SP_ZABR;

implementation
uses uPrK_Resources,uConstants;
{$R *.dfm}

procedure TFormPRK_SP_ZABR.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_ZABR';
  SelectSQLText        :='Select * from PRK_SP_ZABR_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_ZABR_ADD';
  StoredProcChangeName :='PRK_SP_ZABR_CHANGE';
  StoredProcDelName    :='PRK_SP_ZABR_DEL';
  NamePrKSpravEdit     := PrKSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_ZABR_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
