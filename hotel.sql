PGDMP  &                    |            hotel    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16421    hotel    DATABASE     y   CREATE DATABASE hotel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE hotel;
                     postgres    false            �            1259    16423 
   apartments    TABLE     �   CREATE TABLE public.apartments (
    apartments_id integer NOT NULL,
    name character varying(100),
    price numeric(10,2),
    description text,
    rooms integer,
    prepayment character varying(200) NOT NULL,
    img character varying(500)
);
    DROP TABLE public.apartments;
       public         heap r       postgres    false            �            1259    16422    apartments_apartments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.apartments_apartments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.apartments_apartments_id_seq;
       public               postgres    false    218            �           0    0    apartments_apartments_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.apartments_apartments_id_seq OWNED BY public.apartments.apartments_id;
          public               postgres    false    217            �            1259    16439    order    TABLE     �   CREATE TABLE public."order" (
    order_id integer NOT NULL,
    apartments_id integer NOT NULL,
    user_id integer NOT NULL,
    status character varying(50) NOT NULL
);
    DROP TABLE public."order";
       public         heap r       postgres    false            �            1259    16438    order_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_order_id_seq;
       public               postgres    false    222            �           0    0    order_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.order_order_id_seq OWNED BY public."order".order_id;
          public               postgres    false    221            �            1259    16432    user    TABLE       CREATE TABLE public."user" (
    user_id integer NOT NULL,
    surname character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    patronymic character varying(50),
    telephone character varying(20),
    email character varying(100),
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    role character varying(10) NOT NULL
);
    DROP TABLE public."user";
       public         heap r       postgres    false            �            1259    16431    user_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public               postgres    false    220            �           0    0    user_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;
          public               postgres    false    219            +           2604    16426    apartments apartments_id    DEFAULT     �   ALTER TABLE ONLY public.apartments ALTER COLUMN apartments_id SET DEFAULT nextval('public.apartments_apartments_id_seq'::regclass);
 G   ALTER TABLE public.apartments ALTER COLUMN apartments_id DROP DEFAULT;
       public               postgres    false    218    217    218            -           2604    16442    order order_id    DEFAULT     r   ALTER TABLE ONLY public."order" ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);
 ?   ALTER TABLE public."order" ALTER COLUMN order_id DROP DEFAULT;
       public               postgres    false    222    221    222            ,           2604    16435    user user_id    DEFAULT     n   ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);
 =   ALTER TABLE public."user" ALTER COLUMN user_id DROP DEFAULT;
       public               postgres    false    220    219    220            �          0    16423 
   apartments 
   TABLE DATA           e   COPY public.apartments (apartments_id, name, price, description, rooms, prepayment, img) FROM stdin;
    public               postgres    false    218   �       �          0    16439    order 
   TABLE DATA           K   COPY public."order" (order_id, apartments_id, user_id, status) FROM stdin;
    public               postgres    false    222   2        �          0    16432    user 
   TABLE DATA           m   COPY public."user" (user_id, surname, name, patronymic, telephone, email, login, password, role) FROM stdin;
    public               postgres    false    220   �        �           0    0    apartments_apartments_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.apartments_apartments_id_seq', 1, false);
          public               postgres    false    217            �           0    0    order_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_order_id_seq', 1, false);
          public               postgres    false    221            �           0    0    user_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_user_id_seq', 1, false);
          public               postgres    false    219            /           2606    16430    apartments apartments_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_pkey PRIMARY KEY (apartments_id);
 D   ALTER TABLE ONLY public.apartments DROP CONSTRAINT apartments_pkey;
       public                 postgres    false    218            3           2606    16444    order order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public                 postgres    false    222            1           2606    16437    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public                 postgres    false    220            4           2606    16445    order order_apartments_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_apartments_id_fkey FOREIGN KEY (apartments_id) REFERENCES public.apartments(apartments_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_apartments_id_fkey;
       public               postgres    false    4655    218    222            5           2606    16450    order order_user_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_user_id_fkey;
       public               postgres    false    222    220    4657            �   �   x�Ŏ��@D�*� �d�!p/��%���� ��NX�ha�#��;�����qapÌ�4�YZt�Jlx[U.�x�G��\�&L��xB�� ^����|���4���p��i���][]�>��"���uF���-�Z��Z���Y]m笵_kY�      �   P   x�32�42�4�0�¾�.v_��ed2A2�2�2�2��*d���C�� S�S�S�z#4!G��qqq ��oj      �   '   x�3�,I-.�O��)��y\���ũE�	8�+F��� ��!v     