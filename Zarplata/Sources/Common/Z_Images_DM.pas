unit Z_Images_DM;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type TZButtonsImage = (zbiInsert,zbiUpdate,zbiDelete,zbiDetail,
                       zbiSelect,zbiSelectAll,zbiFilter,zbiLocate,
                       zbiLocateNext,zbiSave,zbiPlus,zbiMinus,zbiExit);

type
  TDMImages = class(TDataModule)
    PImages: TImageList;
  private
    { Private declarations }
  public
    function ImageIndexByName(AName:TZButtonsImage):integer;
    property Images:TImageList read PImages;
  end;

implementation

{$R *.dfm}

function TDMImages.ImageIndexByName(AName:TZButtonsImage):integer;
begin
 result:=ord(AName);
end;

end.
