#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�5�cmain.sh �X[s��~ǯXCQ�@�RyG��XcZ҈T��q<$a� ��h�3�;r"Y�N�m\;i<�T�4i�Q��T�������HJI�P�f����η�焐�U�,0L�
�����KS2d��Ю�ٜD��e�� �e�P��V��щ����`]�-�BQ�.{)�H
���ɪi���0gg�dza*u.ֻں��x�N�z[ˈ
T��?&�7Q�V�H�wGF.������R�{UbOיQ��.<�]��[ ����ϔ5��^Z\�ϥ������s�H��E�"�Q�h���b<�J�Ӊ�T<�r��J{�ӞX� �2� ��۶r��9�|��Al�B�dX�r�4UTI���,��ߡ����X-Bdn1�Uݐ1���zd�=�`�w�m��Rw�b��]����]8\��@�xA-�2�p�MBfX%=��wo���^*Z��{� �'��*��I��;%ID�&Aԑ��h�q��fy�����WMMe�C���vY���u�0ɯ�~K�A�ySp����k�ؠ����b�1	gE|�K���"��)���@�"Դ�*���Q�#-c+�C>��������e�-1�V�	��&�1�wYL�HMJ�k(�Յ�(�I����/̂�P��%t��H�dI6B�zփ���2�
;��+aPi�u��2�w��u`�!�	�ժ�����
2������s����tbv�|�=�z�����NÕUd��E�k�H�*�[�G�~;���e�:��0B���v����	X8���`5��i�l�a����c�y����]����ffV� ��?,�bXe5�je5�̐����l6�]V#&��j�u]3��$�j���Ӿ+J��Q�@�&�v�+��L���_ѐ
r�͟B��M��K@V!RʎF�"�!�gxt̽�
�՚;��ۃ<��Y.��֬.��JB��\|������ޫw���!���͉�VV��M���1��w�R�:f����L��(��ĩ�\7�ꉙ�Y�h+&�SF{�0�,��.,�gf�ө��߸��/ͦ���3�X�&;��z8�� \�֌8���V�4HI���$)*��7酋��\	�GGѿ���@��cx�挲2e�t�,gc�~n{��	�v�4���'0��-@p���똠��x��/����p��f
Eb�DQ�bQvl������0�L�	Z\��������v�ce��0���,��n�]�������<_K
ع�� �ZN�\�6�Дo���g�����)u<��7���!K*�ZFN�1>ݜg����}k�~�{���>�����'��������o~�{�>��--M��2�*�c/h�dE�Q~�/�x�U�R04��\������ L�H.��y�FG���1�?.u!q
g�"��U*jX�D�	��G~=1�O�CR̉��i��T��c���p���5˺����8��)��=9�8
1'���	�
҄�
8)�:G�R:)��U�D�(���]+p�shK�T�^�����b��QZN"l��c�o<Yo��c{�9"?�@��D���𹽹��+m��o`�V�i'��IK1_��:�q�q�v���]���O{����o|ko_o�{no?��ز7�ǽ�Ǎ�_?k��p�����O��^�[�R�������w��A|���成�ќ��բё�:�/5�$s���ޣ�Ww���Ý����ʹ�k7t�*�xf�� U��"^���[�� `�7m��lc.�H�`.���M"g�*5� 1[Q�I�x�U���}VM'���Gc����>V,NO��,���޸����뻯��t���7xZ��T�]��7���y��w�~�i3���-iY����)���t3����{g��잷�w�7�z��h#M���o�������~��3�#�?����'��Z�j?����#{������=4���6ń����ׯ�����v��?��l5�:�bw��nt0�~u���?4�}z����2P�Vy�6�r�8y�f-_,{�fJ3|i�!�Q���kUp���1�q����k ��)��X��ń�r�6=
����c�w_8�}���	��[_���M��C=���%�}x�'�\�Ջ	K]%��6(M2�nz��f��W��/8݆�'��0}c�C��c�  